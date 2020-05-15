*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-453: Adjust default password for XMC datapump to match default in Justice.

Suite Setup     XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown  XMC Log Out and Close Browser

*** Test Cases ***
Confirm Data Pump Password Option Default Value
    XMC Navigate To Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    XMC Select Options Tree Node  Data Pump
    XMC Confirm Option Value Data Pump Password  extreme
