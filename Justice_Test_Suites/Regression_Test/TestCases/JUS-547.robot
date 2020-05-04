*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-547: Hide XMC Data Pump options under Beta flag

Suite Setup     XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown  XMC Log Out and Close Browser

*** Test Cases ***
Confirm XMC Data Pump Options Hidden Under Beta Flag
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
    XMC Click Options Tab
    sleep  1 second
    XMC Confirm Option Not Present  XMC Data Pump

Confirm XMC Data Pump Options Displayed With Beta Flag
    XMC Click Diagnostics Tab
    XMC Confirm Diagnostics Tab Loaded
    XMC Set Main Diagnostic Level  Diagnostic
    sleep  1 second
    XMC Expand Diagnostics Tree Node  Beta Features
    XMC Select Diagnostics Tree Node  Enable/Disable Beta Features
    Wait Until Page Contains  Enable/Disable Beta Features  timeout=5 seconds
    XMC Enable Beta Features  netsight
    sleep  1 second
    XMC Confirm Beta Features Enabled
    XMC Click Options Tab
    XMC Confirm Option Present  XMC Data Pump
