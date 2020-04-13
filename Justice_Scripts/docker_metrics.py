#!/usr/bin/python

# Script to facilitate querying of the Metricbeat visualization containing
# docker system metrics

import paramiko
import json
import argparse
import datetime


def getDescription():
    """ Script description in help """
    return "Retrieve service metrics from Justice Server Node"


parser = argparse.ArgumentParser(description=getDescription())
parser.add_argument('host', help='ElasticSearch IPv4 address')
parser.add_argument('username', help='SSH Username to Justice server')
parser.add_argument('password', help='SSH Password to Justice server')
parser.add_argument('--minutes', help='Query the last N minutes',
                    type=int, default=15)
args = parser.parse_args()

requestJSONPath = "request.json"

esDockerContainerName = "justice_elasticsearch_1"

dictMapping = {"1": "container.id",
               "3": "docker.cpu.total.pct",
               "4": "docker.diskio.total",
               "5": "docker.memory.usage.pct",
               "6": "docker.memory.rss.total"}


def createRequestFromTemplate(starttime=datetime.datetime.now()
                              - datetime.timedelta(minutes=15),
                              endtime=datetime.datetime.now()):
    """ Generates an ElasticSearch query request body

    By default, this will take the request contained in this same directory,
    replace timestamps specified in the argument, and write a request.json file
    to be used in an ElasticSearch POST Request.

    The function accepts a start and end time (inclusive), and returns the
    request body in JSON format

    """
    with open('request.template') as template_file:
        with open(requestJSONPath, 'w') as json_file:
            arr = template_file.readlines()

            strStartTime = datetime.datetime.strftime(starttime,
                                                      '%Y-%m-%dT%H:%M:%S.000')

            strEndTime = datetime.datetime.strftime(endtime,
                                                    '%Y-%m-%dT%H:%M:%S.000')
            for line in arr:
                line = line.replace("${START_TIME}", strStartTime)
                line = line.replace("${END_TIME}", strEndTime)
                json_file.write(line+"\n")


def sendMetricbeatESQuery(host, username, password):
    """ Given the ElasticSearch host and SSH credentials, sends a POST request 
        containing the ElasticSearch query to retrieve metric beat statistics 
        for the Docker overview visualization
    """

    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, username=username, password=password)
    ftp_client = ssh.open_sftp()
    tmpJSONPath = '/tmp/' + requestJSONPath
    ftp_client.put(requestJSONPath,
                   tmpJSONPath)
    ftp_client.close()
    ssh.exec_command('docker cp ' + tmpJSONPath +
                     ' ' + esDockerContainerName + ':' + tmpJSONPath)

    dockerExecCmd = 'docker exec -i ' + esDockerContainerName + \
                    ' /usr/bin/curl -H "Content-Type: application/json"' \
                    ' --data-binary @' + tmpJSONPath + \
                    ' http://localhost:9200/metricbeat-*/_search'
    stdin, stdout, stderr = ssh.exec_command(dockerExecCmd)

    output = stdout.readline()

    return json.loads(output)


def printESResponseToCSV(jsonresp):
    """ Given a dictionary object containing the JSON response,
        prints out a tablified version of the data (in CSV format)
    """

    aggarr = jsonresp['aggregations']['2']['buckets']

    print(",".join(dictMapping.values()))

    for entry in aggarr:
        aggval = []
        aggval.append(entry["key"])
        for mapKey in dictMapping:
            aggval.append(str(entry[mapKey]['value']))
        print(",".join(aggval))


def main(args):

    createRequestFromTemplate(datetime.datetime.now()
                              - datetime.timedelta(minutes=args.minutes),
                              datetime.datetime.now())

    jsonresp = sendMetricbeatESQuery(args.host,
                                     args.username, args.password)

    printESResponseToCSV(jsonresp)


if __name__ == '__main__':
    main(args)
