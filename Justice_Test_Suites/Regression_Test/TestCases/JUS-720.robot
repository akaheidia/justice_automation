*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-720: XMC Data Pump Add "Enable Secured connection" option.

Suite Setup      XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown   XMC Log Out and Close Browser

*** Test Cases ***
Confirm XMC Data Pump Option Enable Shared Connection Present
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    sleep  1 second
    XMC Select Options Tree Node  XMC Data Pump
    XMC Options Click Restore Defaults
    XMC Set Option Value XMC Data Pump Enable Sharing
    sleep  1 second
    XMC Confirm Option Label XMC Data Pump Enable Secured Connection
    XMC Confirm Option Value XMC Data Pump Secured Connection Enabled

Confirm XMC Data Pump Option Port Default Value
    XMC Confirm Option Value XMC Data Pump Port  ${option_port}

