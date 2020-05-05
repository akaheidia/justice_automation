*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-575: XMC Data Pump Diagnostic Should Be Hidden Under Beta Flag

Suite Setup     XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown  XMC Log Out and Close Browser

*** Test Cases ***
Confirm XMC Data Pump Diagnostic Hidden Under Beta Flag
    XMC Navigate To Administration Page
    XMC Click Diagnostics Tab
    XMC Confirm Diagnostics Tab Loaded
    XMC Set Main Diagnostic Level  Diagnostic
    sleep  1 second
    XMC Expand Diagnostics Tree Node  Beta Features
    XMC Select Diagnostics Tree Node  Enable/Disable Beta Features
    Wait Until Page Contains  Enable/Disable Beta Features  timeout=5 seconds
    XMC Disable Beta Features
    sleep  1 second
    XMC Confirm Beta Features Disabled
    XMC Expand Diagnostics Tree Node  Server
    XMC Select Diagnostics Tree Node  Server Diagnostics
    Wait Until Page Does Not Contain  XMC Data Pump  timeout=5 seconds

Confirm XMC Data Pump Dianostic Displayed With Beta Flag
    XMC Confirm Diagnostics Tab Loaded
    XMC Set Main Diagnostic Level  Diagnostic
    sleep  1 second
    XMC Expand Diagnostics Tree Node  Beta Features
    XMC Select Diagnostics Tree Node  Enable/Disable Beta Features
    Wait Until Page Contains  Enable/Disable Beta Features  timeout=5 seconds
    XMC Enable Beta Features  netsight
    sleep  1 second
    XMC Confirm Beta Features Enabled
    XMC Expand Diagnostics Tree Node  Server
    XMC Select Diagnostics Tree Node  Server Diagnostics
    Wait Until Page Contains  XMC Data Pump  timeout=5 seconds
