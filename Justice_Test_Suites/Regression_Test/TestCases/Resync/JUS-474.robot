*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-474: Missing User Group off and on during resync testing with small queue size/dropped actions.

#Suite Teardown  Close All Connections
#
#*** Variables ***
#${prompt}    $
#${jus_ip}    ${JUS_HOST_IP}
#${jus_user}  ${JUS_USERNAME}
#${jus_pwd}   ${JUS_PASSWORD}
#${url_jus}   ${JUS_URL}
#${xmc_ip}    ${XMC_HOST_IP}
#${xmc_user}  ${XMC_USERNAME}
#${xmc_pwd}   ${XMC_PASSWORD}
#${xmc_log}   ${XMC_SERVER_LOG}

*** Test Cases ***
#Perform Resync
#    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.
#    sleep  60 seconds
#    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
#
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Starting Resync...
#    sleep  60 seconds
#    sleep  60 seconds
#    sleep  60 seconds
#    sleep  60 seconds
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Resync Completed successfully.
#    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  queue has exceeded capacity
#    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  actions are being dropped

Confirm User Can Still Log Into Justice
    Log To Console  This Test Is Consolidated Into the resync.robot Test
#    Open Browser and Log In  ${url_jus}  ${BROWSER}  ${jus_user}  ${jus_pwd}
#    Confirm Successful Login
#    Log Out and Close Browser
