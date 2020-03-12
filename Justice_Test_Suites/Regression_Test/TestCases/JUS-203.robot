*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-203: resync message when justice starts up.

Suite Teardown  Close All Connections

*** Variables ***
${prompt}  $

*** Test Cases ***
Confirm Resync Messages on XMC Reconnect
    Disconnect From RabbitMQ  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}  ${XMC_HOST_IP}  ${prompt}
    Reconnect To RabbitMQ     ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}  ${XMC_HOST_IP}  ${prompt}
    sleep  30 seconds
    Confirm XMC Resync Started    ${XMC_HOST_IP}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    sleep  30 seconds
    Confirm XMC Resync Completed  ${XMC_HOST_IP}  ${XMC_USERNAME}  ${XMC_PASSWORD}

*** Keywords ***
Confirm XMC Resync Started
    [Arguments]  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}
    SSH To XMC Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}

    Write  tail -f ${XMC_SERVER_LOG}
    ${output}=  Read Until  Starting Resync...
    Should Contain  ${output}  Starting Resync...

    Close SSH Connection

Confirm XMC Resync Completed
    [Arguments]  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}
    SSH To XMC Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}

    Write  tail -f ${XMC_SERVER_LOG}
    ${output}=  Read Until   Resync Completed successfully.
    Should Contain  ${output}  Resync Completed successfully.

    Close SSH Connection
