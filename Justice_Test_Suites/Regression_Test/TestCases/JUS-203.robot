*** Settings ***
Library   SSHLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-203: resync message when justice starts up.

Suite Teardown  Clean Up Resync Test

*** Variables ***
${site_name}    NEW SITE
${device_ip}    10.54.142.12

*** Test Cases ***
Disconnect From RabbitMQ
    SSH To Justice Server  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Execute Command  iptables -I FORWARD -s ${XMC_HOST_IP} -j DROP
    Close SSH Connection

Create Site and Device in XMC
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Create Site  ${site_name}
    XMC Click Devices Devices Tab
    XMC Select Device Tree Node  World
    XMC Select Device Tree Node  ${site_name}
    XMC Create Device  ${device_ip}  public_v1_Profile  TestDevice
    XMC Confirm Device In Table  ${device_ip}
    XMC Log Out and Close Browser

Confirm Justice Not Updated
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded
    Expand Servers and Sites Tree Node  ${XMC_HOSTNAME}
    Confirm Filter Panel Does Not Contain Site  ${site_name}
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
    Confirm Device Not In Table  ${device_ip}
    Log Out and Close Browser

Reconnect To RabbitMQ
    SSH To Justice Server  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Execute Command  iptables -D FORWARD -s ${XMC_HOST_IP} -j DROP
    Close SSH Connection
    sleep  10 seconds

Confirm Resync Messages
    Confirm XMC Resync Started    ${XMC_HOST_IP}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    Confirm XMC Resync Completed  ${XMC_HOST_IP}  ${XMC_USERNAME}  ${XMC_PASSWORD}

Confirm Justice Updated
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded
    Expand Servers and Sites Tree Node  ${XMC_HOSTNAME}
    Confirm Filter Panel Contains Site  ${site_name}
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
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

Clean Up Resync Test
    Clean Up XMC
    Close All Connections

Clean Up XMC
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
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
