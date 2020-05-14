*** Settings ***
Library   SeleniumLibrary
Library   SSHLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-461: Add XMC Data Pump to Server Diagnostics.

Suite Teardown  Clean Up Test

*** VARIABLES ***
${device_ip}  10.54.142.12
${xmc_ip}     ${XMC_HOST_IP}
${xmc_user}   ${XMC_USERNAME}
${xmc_pwd}    ${XMC_PASSWORD}
${xmc_log}    ${XMC_SERVER_LOG}

*** Test Cases ***
Confirm Data Pump Present on Server Diagnostics Page
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    XMC Navigate To Administration Page
    XMC Click Diagnostics Tab
    XMC Confirm Diagnostics Tab Loaded
    XMC Expand Diagnostics Tree Node  Server
    XMC Select Diagnostics Tree Node  Server Diagnostics
    Wait Until Page Contains  Data Pump  timeout=5 seconds

Confirm Changing Data Pump Diagnostic Level Works
    XMC Set Data Pump Diagnostic Level  Verbose
    XMC Diagnostics Click OK
    XMC Log Out and Close Browser

Generate XMC Message
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    XMC Navigate to Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Click Devices Devices Tab
    XMC Create Device  ${device_ip}  public_v1_Profile  TestDevice
    XMC Confirm Device In Table  ${device_ip}
    XMC Log Out and Close Browser

Confirm XMC Server Log Contains Verbose Messages
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  TRACE [com.extreme.outboundmessage
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  DEBUG [com.extreme.outboundmessage

*** Keywords ***
Clean Up Test
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    Delete Device
    Reset Diagnostics
    XMC Log Out and Close Browser
    Close All Connections

Delete Device
    XMC Navigate to Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Click Devices Devices Tab
    XMC Delete Device  ${device_ip}
    XMC Refresh Devices Table
    XMC Confirm Device Not In Table  ${device_ip}

Reset Diagnostics
    XMC Navigate to Administration Page
    XMC Click Diagnostics Tab
    XMC Confirm Diagnostics Tab Loaded
    XMC Expand Diagnostics Tree Node  Server
    XMC Select Diagnostics Tree Node  Server Diagnostics
    Wait Until Page Contains  Data Pump  timeout=5 seconds
    XMC Diagnostics Click Reset Defaults
