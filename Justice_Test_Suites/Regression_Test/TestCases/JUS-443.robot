*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-443: Usability - XMC Data Pump options: Domain Node Type option is not at default value.

Suite Setup     XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown  XMC Log Out and Close Browser

*** Test Cases ***
Confirm Domain Node Type Option Default Value
    XMC Navigate To Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    XMC Select Options Tree Node  XMC Data Pump
    XMC Confirm Domain Node Type Option Value  1
