*** Settings ***
Library   OperatingSystem
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-616: Performance script used to gather metricbeats statistics cannot connect to ElasticSearch.

Suite Teardown  Delete Docker Metrics Script Files

*** Variables ***
${test_filename}  metrics_test

*** Test Cases ***
Copy Docker Metrics Script To Current Directory
    Copy Files  ${robot_script_dir}/${docker_metrics_script}  ${robot_script_dir}/${docker_metrics_request_template}  .
    OperatingSystem.File Should Exist  ${docker_metrics_script}
    OperatingSystem.File Should Exist  ${docker_metrics_request_template}

Run Script To Gather Docker Metrics
    Run  .${/}"${DOCKER_METRICS_SCRIPT}" ${JUS_HOST_IP} ${JUS_USERNAME} ${JUS_PASSWORD} > ${test_filename}.csv
    sleep  2 seconds
    OperatingSystem.File Should Exist  ${test_filename}.csv

*** Keywords ***
Delete Docker Metrics Script Files
    OperatingSystem.Remove File  ${test_filename}.csv
    OperatingSystem.Remove File  docker_metrics.py
    OperatingSystem.Remove File  request.template
    OperatingSystem.Remove File  request.json
    OperatingSystem.File Should Not Exist  ${test_filename}.csv
    OperatingSystem.File Should Not Exist  docker_metrics.py
    OperatingSystem.File Should Not Exist  request.template
    OperatingSystem.File Should Not Exist  request.json
