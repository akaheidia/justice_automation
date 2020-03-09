*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Performance Test: Resync.

Suite Teardown  Clean Up Resync Test

*** Variables ***
${site_name}       SYNC TEST SITE
${device_ip}       10.54.142.12
${xmc_ip}          ${XMC_HOST_IP}
${xmc_test_url}    ${XMC_URL}
${xmc_user}        ${XMC_USERNAME}
${xmc_pwd}         ${XMC_PASSWORD}
${xmc_host}        ${XMC_HOSTNAME}
${xmc_log}         ${XMC_SERVER_LOG}
#${xmc_ip}          ${XMC_2_HOST_IP}
#${xmc_test_url}    ${XMC_2_URL}
#${xmc_user}        ${XMC_2_USERNAME}
#${xmc_pwd}         ${XMC_2_PASSWORD}
#${xmc_host}        ${XMC_2_HOSTNAME}
#${xmc_log}         ${XMC_2_SERVER_LOG}

*** Test Cases ***
Disconnect From RabbitMQ
    SSH To Justice Server  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Write  iptables -I FORWARD -s ${xmc_ip} -j DROP
    Write  docker exec -i -t justice_rabbitmq_1 rabbitmqctl close_connection "`docker exec -i -t justice_rabbitmq_1 rabbitmqctl list_connections pid peer_host | grep ${XMC_HOST_IP} | awk '{print ${XMC_HOST_IP}}'`" closing
    Write  echo "XMC disconnected and IP Tables set to block XMC."
    sleep  60 seconds
    Close SSH Connection

Create Site in XMC
    XMC Open Browser and Log In  ${xmc_test_url}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Create Site  ${site_name}
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

Reconnect To RabbitMQ
    SSH To Justice Server  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Write  iptables -D FORWARD -s ${xmc_ip} -j DROP
    Close SSH Connection
    sleep  10 seconds

Confirm Resync Messages
    Confirm XMC Resync Started    ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}
    Confirm XMC Resync Completed  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}

Confirm Justice Updated
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded
    Refresh Servers and Sites Filter
    Expand Servers and Sites Tree Node  ${xmc_host}
    Confirm Filter Panel Contains Site  ${site_name}
    Select Servers and Sites Server Tree Node  ${xmc_host}
    Select Servers and Sites Site Tree Node  ${site_name}
    Confirm Device In Table  ${device_ip}
    Log Out and Close Browser


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
    [Arguments]  ${ip}  ${user}  ${pwd}
    SSH To XMC Server  ${ip}  ${user}  ${pwd}  ${server_log}

    Write  tail -f ${server_log}
    ${output}=  Read Until  Starting Resync...
    Should Contain  ${output}  Starting Resync...

    Close SSH Connection

Confirm XMC Resync Completed
    [Arguments]  ${ip}  ${user}  ${pwd}  ${server_log}
    SSH To XMC Server  ${ip}  ${user}  ${pwd}

    Write  tail -f ${server_log}
    ${output}=  Read Until   Resync Completed successfully.
    Should Contain  ${output}  Resync Completed successfully.

    Close SSH Connection

Clean Up Resync Test
    Clean Up XMC
    Close All Connections

Clean Up XMC
    XMC Open Browser and Log In  ${xmc_test_url}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Click Devices Devices Tab
    XMC Confirm Device In Table  ${device_ip}
    XMC Delete Device  ${device_ip}
    XMC Refresh Devices Table
    XMC Confirm Device Not In Table  ${device_ip}
    XMC Delete Site  ${site_name}
    XMC Log Out and Close Browser
