*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Filters panel on the Monitor page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Filter Panel Expand and Collapse Functionality
    Click Filter Icon
    Confirm Filters Panel Visible
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
