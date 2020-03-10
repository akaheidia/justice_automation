*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Filter panel on the Monitor page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Filter Panel Show and Hide Functionality
    Show Filter Panel
    Confirm Filter Panel Visible
    Hide Filter Panel
    Confirm Filter Panel Not Visible

Confirm Filter Panel Expand and Collapse Functionality
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded
    Confirm Alarm Severity Filter Expanded
    Confirm Site Availability Filter Expanded

    Collapse Servers and Sites Filter
    Collapse Alarm Severity Filter
    Collapse Site Availability Filter
    Confirm Servers and Sites Filter Collapsed
    Confirm Alarm Severity Filter Collapsed
    Confirm Site Availability Filter Collapsed

    Expand Servers and Sites Filter
    Expand Alarm Severity Filter
    Expand Site Availability Filter
    Confirm Servers and Sites Filter Expanded
    Confirm Alarm Severity Filter Expanded
    Confirm Site Availability Filter Expanded

    Expand Servers and Sites Tree Node  ${XMC_HOSTNAME}
    Collapse Servers and Sites Tree Node  ${XMC_HOSTNAME}

Confirm Filter Panel Select Server Functionality
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
    Deselect Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
