*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-318: Handle server disconnects more gracefully.

Suite Teardown  Close All Connections

*** Variables ***
${msg}       No connection to the remote server.
${prompt}    $
${jus_ip}    ${JUS_HOST_IP}
${jus_user}  ${JUS_USERNAME}
${jus_pwd}   ${JUS_PASSWORD}
${xmc_ip}    ${XMC_HOST_IP}
${xmc_user}  ${XMC_USERNAME}
${xmc_pwd}   ${XMC_PASSWORD}
${xmc_log}   ${XMC_SERVER_LOG}

*** Test Cases ***
Confirm Error Message For Disconnected XMC
    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${msg}
    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds
