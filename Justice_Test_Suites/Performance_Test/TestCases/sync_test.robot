*** Settings ***
Library   OperatingSystem
Library   DateTime
#Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Performance Test: Resync.

Suite Teardown  Clean Up Resync Test

*** Variables ***
${prompt}          $
${site_name}       SYNC TEST SITE
${device_ip}       10.54.142.12
${xmc_ip}          ${XMC_HOST_IP}
${xmc_test_url}    ${XMC_URL}
${xmc_user}        ${XMC_USERNAME}
${xmc_pwd}         ${XMC_PASSWORD}
${xmc_host}        ${XMC_HOSTNAME}
${xmc_log}         ${XMC_SERVER_LOG}
${pre_filename}    resync_pretest
${post_filename}   resync_posttest

*** Test Cases ***
Copy Docker Metrics Script To Current Directory
    Copy Files  ${ROBOT_SCRIPT_DIR}/${DOCKER_METRICS_SCRIPT}  ${ROBOT_SCRIPT_DIR}/${DOCKER_METRICS_REQUEST_TEMPLATE}  .
    OperatingSystem.File Should Exist  ${DOCKER_METRICS_SCRIPT}
    OperatingSystem.File Should Exist  ${DOCKER_METRICS_REQUEST_TEMPLATE}

Gather Baseline Metrics
    Run  ./${DOCKER_METRICS_SCRIPT} ${JUS_HOST_IP} > ${pre_filename}.csv
    sleep  2 seconds
    OperatingSystem.File Should Exist  ${pre_filename}.csv

Disconnect XMC From Justice
    Disconnect From RabbitMQ  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}  ${xmc_ip}  ${prompt}
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.

Create Site in XMC
    XMC Open Browser and Log In  ${xmc_test_url}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Create Site  ${site_name}
    sleep  2 seconds
    XMC Confirm Site Exists  ${site_name}
    XMC Log Out and Close Browser

Create Device in XMC
    XMC Open Browser and Log In  ${xmc_test_url}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Select Device Tree Node  ${site_name}
    sleep  5 seconds
    XMC Create Device  ${device_ip}  public_v1_Profile  TestDevice
    XMC Confirm Device In Table  ${device_ip}
    XMC Log Out and Close Browser

Confirm Justice Not Updated
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    sleep  10 seconds
    Confirm Successful Login
    Click List Slider
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded
    Expand Servers and Sites Tree Node  ${xmc_host}
    Confirm Filter Panel Does Not Contain Site  ${site_name}
    Select Servers and Sites Server Tree Node  ${xmc_host}
    Confirm Device Not In Table  ${device_ip}
    Log Out and Close Browser

Reconnect XMC To Justice
    Reconnect To RabbitMQ  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}  ${xmc_ip}  ${prompt}
    sleep  30 seconds

Confirm XMC Resync Messages
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Starting Resync...
    sleep  30 seconds
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Resync Completed successfully.

Confirm Justice Updated
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded
    Refresh Servers and Sites Filter
    Expand Servers and Sites Tree Node  ${xmc_host}
    Confirm Filter Panel Contains Site  ${site_name}
    Clear All Filters
    Select Servers and Sites Site Tree Node  ${site_name}
    Confirm Device In Table  ${device_ip}
    Log Out and Close Browser

Gather Post-Test Metrics
    Run  ./${DOCKER_METRICS_SCRIPT} ${JUS_HOST_IP} > ${post_filename}.csv
    sleep  2 seconds
    OperatingSystem.File Should Exist  ${post_filename}.csv

Save Metric Files
    Create Directory  Metrics
    ${date}=  Get Current Date  exclude_millis=yes
    ${convert}=  Convert Date  ${date}  result_format=%m-%d-%Y_%H:%M
    Log To Console  ${convert}
    Run  cat ${pre_filename}.csv > "${pre_filename}-${convert}.csv"
    Run  cat ${post_filename}.csv > "${post_filename}-${convert}.csv"
    Move Files  *-${convert}.csv  Metrics
    Run  rm *.csv

*** Keywords ***
Clean Up Resync Test
    Delete Test Device
    Delete Test Site
    Delete Docker Metrics Script Files
    Close All Connections

Delete Test Device
    XMC Open Browser and Log In  ${xmc_test_url}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Click Devices Devices Tab
    XMC Confirm Device In Table  ${device_ip}
    XMC Delete Device  ${device_ip}
    XMC Refresh Devices Table
    XMC Confirm Device Not In Table  ${device_ip}
    XMC Log Out and Close Browser

Delete Test Site
    XMC Open Browser and Log In  ${xmc_test_url}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Delete Site  ${site_name}
    sleep  2 seconds
    XMC Confirm Site Does Not Exist  ${site_name}
    XMC Log Out and Close Browser

Delete Docker Metrics Script Files
    Run  rm docker_metrics.py
    Run  rm request.template
    Run  rm request.json
    OperatingSystem.File Should Not Exist  docker_metrics.py
    OperatingSystem.File Should Not Exist  request.template
    OperatingSystem.File Should Not Exist  request.json
