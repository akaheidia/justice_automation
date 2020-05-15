*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-203: resync message when justice starts up.

#Suite Teardown  Close All Connections

#*** Variables ***
#${prompt}    $
#${jus_ip}    ${JUS_HOST_IP}
#${jus_user}  ${JUS_USERNAME}
#${jus_pwd}   ${JUS_PASSWORD}
#${xmc_ip}    ${XMC_HOST_IP}
#${xmc_user}  ${XMC_USERNAME}
#${xmc_pwd}   ${XMC_PASSWORD}
#${xmc_log}   ${XMC_SERVER_LOG}

*** Test Cases ***
Confirm Resync Messages on XMC Reconnect
    Log To Console  This Test Is Consolidated Into the resync.robot Test
#    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.
#
#    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
#
#    sleep  60 seconds
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Starting Resync...
#    sleep  60 seconds
#    sleep  60 seconds
#    sleep  60 seconds
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Resync Completed successfully.
