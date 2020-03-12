#!/usr/bin/python

# Script to facilitate querying of the Metricbeat visualization containing
# docker system metrics

import requests
import json
import argparse
import datetime


def getDescription():
    """ Script description in help """
    return "Retrieve service metrics from Justice Server Node"


parser = argparse.ArgumentParser(description=getDescription())
parser.add_argument('host', help='ElasticSearch IPv4 address')
parser.add_argument('--minutes', help='Query the last N minutes',
                    type=int, default=15)
args = parser.parse_args()

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
        with open('request.json', 'w') as json_file:
            arr = template_file.readlines()

            strStartTime = datetime.datetime.strftime(starttime,
                                                      '%Y-%m-%dT%H:%M:%S.000')

            strEndTime = datetime.datetime.strftime(endtime,
                                                    '%Y-%m-%dT%H:%M:%S.000')
            for line in arr:
                line = line.replace("${START_TIME}", strStartTime)
                line = line.replace("${END_TIME}", strEndTime)
                json_file.write(line+"\n")


def sendMetricbeatESQuery(host):
    """ Given the ElasticSearch host, sends a POST request containing
        the ElasticSearch query to retrieve metric beat statistics for the
        Docker overview visualization
"""

    with open('request.json') as json_file:
        data = json.load(json_file)
        headers = {'Content-Type': 'application/json'}
        resp = requests.post('http://' + host
                             + ':9200/metricbeat-*/_search',
                             headers=headers,
                             data=json.dumps(data))

        return json.loads(resp.text)


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

    jsonresp = sendMetricbeatESQuery(args.host)

    printESResponseToCSV(jsonresp)


if __name__ == '__main__':
    main(args)
