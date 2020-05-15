*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-530: Resync: Server missing after resync test.

#Suite Teardown  Close All Connections
#
#*** Variables ***
#${prompt}    $
#${jus_ip}    ${JUS_HOST_IP}
#${jus_user}  ${JUS_USERNAME}
#${jus_pwd}   ${JUS_PASSWORD}
#${xmc_host}  ${XMC_HOSTNAME}
#${xmc_ip}    ${XMC_HOST_IP}
#${xmc_user}  ${XMC_USERNAME}
#${xmc_pwd}   ${XMC_PASSWORD}
#${xmc_log}   ${XMC_SERVER_LOG}

*** Test Cases ***
#Perform Resync
#    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
#    sleep  30 seconds
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.
#    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
#    sleep  60 seconds
#    sleep  60 seconds
#    sleep  60 seconds
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Resync Completed successfully

Confirm XMC Server Present In Justice
    Log To Console  This Test Is Consolidated Into the resync.robot Test
#    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
#    Click Monitor
#    Show Filter Panel
#    Confirm Filter Panel Contains Server  ${xmc_host}
#    Log Out and Close Browser
