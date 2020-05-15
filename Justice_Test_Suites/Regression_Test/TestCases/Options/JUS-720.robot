*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-720: XMC Data Pump Add "Enable Secured connection" option.

Suite Setup      XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown   XMC Log Out and Close Browser

*** Test Cases ***
Confirm Data Pump Option Enable Shared Connection Present
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    sleep  1 second
    XMC Select Options Tree Node  Data Pump
    XMC Options Click Restore Defaults
    XMC Set Option Value Data Pump Enable Sharing
    sleep  1 second
    XMC Confirm Option Label Data Pump Enable Secured Connection
    XMC Confirm Option Value Data Pump Secured Connection Enabled

Confirm Data Pump Option Port Default Value
    XMC Confirm Option Value Data Pump Port  ${option_secure_port}
