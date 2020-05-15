*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-355: Send Analytics Engines (devices) to Justice on startup.

#*** Variables ***
#${engine_ip}    1.1.1.1
#${device_ip}    10.54.142.12
#${prompt}       $
#${jus_ip}       ${JUS_HOST_IP}
#${jus_user}     ${JUS_USERNAME}
#${jus_pwd}      ${JUS_PASSWORD}
#${xmc_ip}       ${XMC_HOST_IP}
#${xmc_host}     ${XMC_HOSTNAME}
#${xmc_user}     ${XMC_USERNAME}
#${xmc_pwd}      ${XMC_PASSWORD}
#${xmc_log}      ${XMC_SERVER_LOG}
#${url_for_xmc}  ${XMC_URL}
#${url_for_jus}  ${JUS_URL}

*** Test Cases ***
Send Analytics Devices To Justice On Startup
    Log To Console  This Test Is Consolidated Into the resync.robot Test

#Disconnect XMC From Justice Before Creating Devices
#    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.
#
#Create Analytics Engine In XMC
#    XMC Open Browser and Log In  ${url_for_xmc}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
#    XMC Navigate To Analytics Page
#    XMC Click Analytics Configuration Tab
#    XMC Analytics Configuration Close Add Engine Dialog If Displayed
#    XMC Analytics Configuration Click Add
#    XMC Analytics Configuration Confirm Add Engine Dialog Displayed
#    XMC Analytics Configuration Add Engine Set IP Address  ${engine_ip}
#    XMC Analytics Configuration Add Engine Set Name        Engine #1
#    XMC Analytics Configuration Add Engine Select Profile  snmp_v3_profile
#    XMC Analytics Configuration Add Engine Click OK
#    XMC Analytics Configuration Confirm Add Engine Dialog Not Displayed
#
#    XMC Navigate to Network Page
#    XMC Click Devices Tab
#    XMC Click Devices Devices Tab
#    XMC Confirm Device In Table  ${engine_ip}
#    XMC Log Out and Close Browser
#
#Create Regular Device In XMC
#    XMC Open Browser and Log In  ${url_for_xmc}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
#    XMC Navigate To Network Page
#    XMC Click Devices Tab
#    XMC Confirm Devices Tab Loaded
#    XMC Click Devices Devices Tab
#    XMC Create Device  ${device_ip}  public_v1_Profile  TestDevice
#    XMC Log Out and Close Browser
#
#Restart XMC Server After Creating Devices
#    Log To Console  Commented out until JUS-562 is fixed (XMC server restart prevents resync)
##    XMC Restart Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}
##    XMC Wait For Server Restart  ${url_for_xmc}  ${BROWSER}
#
#Connect XMC To Justice After Creating Devices
#    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
#
#    sleep  60 seconds
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Starting Resync...
#    sleep  60 seconds
#    sleep  60 seconds
#    sleep  60 seconds
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Resync Completed successfully.
#
#Confirm Devices Added To Justice
#    Open Browser and Log In  ${url_for_jus}  ${BROWSER}  ${jus_user}  ${jus_pwd}
#    Click List Slider
#    Show Filter Panel
#    Confirm Filter Panel Visible
#    Confirm Servers and Sites Filter Expanded
#    Select Servers and Sites Server Tree Node  ${xmc_host}
#    Refresh Devices Table
#    Search Field Enter Text  ${engine_ip}
#    Confirm Device In Table  ${engine_ip}
#    Search Field Enter Text  ${device_ip}
#    Confirm Device In Table  ${device_ip}
#    Log Out and Close Browser
#
#Disconnect XMC From Justice Before Deleting Devices
#    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.
#
#Delete Analytics Engine From XMC
#    XMC Open Browser and Log In  ${url_for_xmc}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
#    XMC Navigate To Analytics Page
#    XMC Click Analytics Configuration Tab
#    XMC Analytics Configuration Select Tree Node  Engines
#    XMC Analytics Configuration Select Engine In Table  ${engine_ip}
#    XMC Analytics Configuration Click Delete
#    XMC Analytics Configuration Confirm Delete  ${engine_ip}  true
#
#    XMC Navigate to Network Page
#    XMC Click Devices Tab
#    XMC Click Devices Devices Tab
#    XMC Confirm Device Not In Table  ${engine_ip}
#    XMC Log Out and Close Browser
#
#Delete Regular Device From XMC
#    XMC Open Browser and Log In  ${url_for_xmc}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
#    XMC Navigate To Network Page
#    XMC Click Devices Tab
#    XMC Confirm Devices Tab Loaded
#    XMC Click Devices Devices Tab
#    XMC Confirm Device In Table  ${device_ip}
#    XMC Delete Device  ${device_ip}
#    XMC Refresh Devices Table
#    XMC Confirm Device Not In Table  ${device_ip}
#    XMC Log Out and Close Browser
#
#Restart XMC Server After Deleting Devices
#    Log To Console  Commented out until JUS-562 is fixed (XMC server restart prevents resync)
##    XMC Restart Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}
##    XMC Wait For Server Restart  ${url_for_xmc}  ${BROWSER}
#
#Connect XMC To Justice After Deleting Devices
#    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
#
#    sleep  60 seconds
#    sleep  60 seconds
#    sleep  60 seconds
#    sleep  60 seconds
#    sleep  60 seconds
#    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Resync Completed successfully.
#
#Confirm Devices Removed From Justice
#    Open Browser and Log In  ${url_for_jus}  ${BROWSER}  ${jus_user}  ${jus_pwd}
#    Click List Slider
#    Show Filter Panel
#    Confirm Filter Panel Visible
#    Confirm Servers and Sites Filter Expanded
#    Select Servers and Sites Server Tree Node  ${xmc_host}
#    Search Field Enter Text  ${engine_ip}
#    Confirm Device Not In Table  ${engine_ip}
#    Search Field Enter Text  ${device_ip}
#    Confirm Device Not In Table  ${device_ip}
#    Log Out and Close Browser
