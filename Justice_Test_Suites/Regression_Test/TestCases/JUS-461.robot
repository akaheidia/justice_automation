*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-461: Add XMC Data Pump to Server Diagnostics.

Suite Setup     XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown  XMC Log Out and Close Browser

*** Test Cases ***
Diagnostics Test
    XMC Navigate To Administration Page
    XMC Click Diagnostics Tab
    XMC Confirm Diagnostics Tab Loaded
    XMC Expand Diagnostics Tree Node  Server
    XMC Select Diagnostics Tree Node  Server Diagnostics
    Wait Until Page Contains  XMC Data Pump  timeout=5 seconds
    XMC Set XMC Data Pump Diagnostic Level  Off
    XMC Set XMC Data Pump Diagnostic Level  Critical
    XMC Set XMC Data Pump Diagnostic Level  Warning
    XMC Set XMC Data Pump Diagnostic Level  Informational
    XMC Set XMC Data Pump Diagnostic Level  Verbose
    XMC Set XMC Data Pump Diagnostic Level  Default emc.xml Value
    XMC Set XMC Data Pump Diagnostic Level  Verbose
    XMC Diagnostics Click OK
    XMC Diagnostics Click Reset Defaults
