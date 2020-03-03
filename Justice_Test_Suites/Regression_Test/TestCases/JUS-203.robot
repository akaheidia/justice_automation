*** Settings ***
Library   SSHLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-203: resync message when justice starts up.

Suite Teardown  Close All Connections

*** Test Cases ***
Resync Test
    Disconnect From RabbitMQ      ${XMC_HOST_IP}
    sleep  5 seconds
    Reconnect To RabbitMQ         ${XMC_HOST_IP}
    sleep  10 seconds
    Confirm XMC Resync Started    ${XMC_HOST_IP}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    Confirm XMC Resync Completed  ${XMC_HOST_IP}  ${XMC_USERNAME}  ${XMC_PASSWORD}

*** Keywords ***
SSH To Justice Server
    [Arguments]  ${host}  ${user}  ${pwd}
    ${login_output}=  Open SSH Connection and Log In  ${host}  ${user}  ${pwd}
    Should Contain    ${login_output}  Justice Server Appliance

SSH To XMC Server
    [Arguments]  ${host}  ${user}  ${pwd}
    ${login_output}=  Open SSH Connection and Log In  ${host}  ${user}  ${pwd}
    Should Contain    ${login_output}  Management Center

Disconnect From RabbitMQ
    [Arguments]  ${xmc}
    SSH To Justice Server  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Execute Command  iptables -I FORWARD -s ${xmc} -j DROP
    Close SSH Connection

Reconnect To RabbitMQ
    [Arguments]  ${xmc}
    SSH To Justice Server  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Execute Command  iptables -D FORWARD -s ${xmc} -j DROP
    Close SSH Connection

Confirm XMC Resync Started
    [Arguments]  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}
    SSH To XMC Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}

    ${command_output}=  Execute Command  grep RESYNC ${XMC_SERVER_LOG} | grep -v RESYNC_END
    Should Contain  ${command_output}  RESYNC

    Close SSH Connection

Confirm XMC Resync Completed
    [Arguments]  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}
    SSH To XMC Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}

    # Give the resync time to finish
    : FOR  ${index}  IN RANGE  1  1000
    \    ${command_output}=  Execute Command  grep RESYNC_END ${XMC_SERVER_LOG}
    \    ${resync_end}=  Run Keyword And Return Status  Should Contain  ${command_output}  RESYNC_END
    \    Exit For Loop If  ${resync_end} == True
    ${command_output}=  Execute Command  grep RESYNC_END ${XMC_SERVER_LOG}
    Should Contain  ${command_output}  RESYNC_END

    Close SSH Connection
