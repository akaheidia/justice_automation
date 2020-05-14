*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-662: XMC Data Pump Options label change.

Suite Setup      XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown   XMC Log Out and Close Browser

*** Test Cases ***
Confirm Data Pump Option Enable Sharing Label
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    XMC Select Options Tree Node  Data Pump
    XMC Confirm Option Label Data Pump Enable Sharing
