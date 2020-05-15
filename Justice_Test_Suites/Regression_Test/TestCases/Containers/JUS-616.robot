*** Settings ***
Library   OperatingSystem
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-616: Performance script used to gather metricbeats statistics cannot connect to ElasticSearch.

Suite Teardown  Delete Docker Metrics Script Files

*** Variables ***
${test_filename}                    metrics_test
${robot_script_dir}                 ../../Justice_Scripts
${docker_metrics_script}            docker_metrics.py
${docker_metrics_request_template}  request.template

*** Test Cases ***
Copy Docker Metrics Script To Current Directory
    Copy Files  ${robot_script_dir}/${docker_metrics_script}  ${robot_script_dir}/${docker_metrics_request_template}  .
    OperatingSystem.File Should Exist  ${docker_metrics_script}
    OperatingSystem.File Should Exist  ${docker_metrics_request_template}

Run Script To Gather Docker Metrics
    Run  ./${DOCKER_METRICS_SCRIPT} ${JUS_HOST_IP} ${JUS_USERNAME} ${JUS_PASSWORD} > ${test_filename}.csv
    sleep  2 seconds
    OperatingSystem.File Should Exist  ${test_filename}.csv

*** Keywords ***
Delete Docker Metrics Script Files
    Run  rm ${test_filename}.csv
    Run  rm docker_metrics.py
    Run  rm request.template
    Run  rm request.json
    OperatingSystem.File Should Not Exist  ${test_filename}.csv
    OperatingSystem.File Should Not Exist  docker_metrics.py
    OperatingSystem.File Should Not Exist  request.template
    OperatingSystem.File Should Not Exist  request.json
