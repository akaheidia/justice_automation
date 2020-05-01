*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-562: Resync: Resync does not occur if XMC server is restarted while disconnected.

Suite Teardown  Close All Connections

*** Variables ***
${prompt}       $
${jus_ip}       ${JUS_HOST_IP}
${jus_user}     ${JUS_USERNAME}
${jus_pwd}      ${JUS_PASSWORD}
${xmc_ip}       ${XMC_HOST_IP}
${xmc_user}     ${XMC_USERNAME}
${xmc_pwd}      ${XMC_PASSWORD}
${xmc_log}      ${XMC_SERVER_LOG}
${url_for_xmc}  ${XMC_URL}

*** Test Cases ***
Disconnect XMC From Justice
    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  30 seconds
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.

Restart XMC Server After Creating Devices
    Log To Console  Commenting out this step until JUS-562 is addressed
#    XMC Restart Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}
#    XMC Wait For Server Restart  ${url_for_xmc}  ${BROWSER}

Connect XMC To Justice
    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  60 seconds

Confirm Resync Messages on XMC Reconnect
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Starting Resync...
    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Resync Completed successfully.
