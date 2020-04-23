*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-538: Reports: When XMC disconnects/reconnects, reports lose historical data.

Suite Teardown  Close All Connections

*** Variables ***
${prompt}    $
${jus_ip}    ${JUS_HOST_IP}
${jus_user}  ${JUS_USERNAME}
${jus_pwd}   ${JUS_PASSWORD}
${xmc_ip}    ${XMC_HOST_IP}
${xmc_user}  ${XMC_USERNAME}
${xmc_pwd}   ${XMC_PASSWORD}
${xmc_log}   ${XMC_SERVER_LOG}

*** Test Cases ***
Perform Resync
    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  30 seconds
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.
    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  60 seconds

    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Starting Resync...
    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Resync Completed successfully.

Confirm Report Data Is Present In Justice
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Navigate to Site Availability Report
    Confirm Site Availability Report Table Contains Value  ${site_device_down}
    Site Availability Drill Into Site  ${site_device_down}
    Log Out and Close Browser
