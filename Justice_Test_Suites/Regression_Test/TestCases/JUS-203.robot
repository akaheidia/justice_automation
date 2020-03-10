*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-203: resync message when justice starts up.

Suite Teardown  Close All Connections


*** Test Cases ***
Disconnect From RabbitMQ
    SSH To Justice Server  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Write  iptables -I FORWARD -s ${XMC_HOST_IP} -j DROP
    Write  docker exec -i -t justice_rabbitmq_1 rabbitmqctl close_connection "`docker exec -i -t justice_rabbitmq_1 rabbitmqctl list_connections pid peer_host | grep ${XMC_HOST_IP} | awk '{print ${XMC_HOST_IP}}'`" closing
    Write  echo "XMC disconnected and IP Tables set to block XMC."
    sleep  60 seconds
    Close SSH Connection

Reconnect To RabbitMQ
    SSH To Justice Server  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Write  iptables -D FORWARD -s ${XMC_HOST_IP} -j DROP
    Close SSH Connection

Confirm Resync Messages
    sleep  60 seconds
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
