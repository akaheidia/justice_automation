*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-517: Events: Sorting via popup for several fields results in empty table.

Suite Setup      Log In and Navigate to Events Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser
Test Template    Apply Sort and Confirm Events Present

*** Test Cases ***             SORT
Sort By Category               Category
Sort By Client                 Client
Sort By Date/Time              Date/Time
Sort By Event                  Event
Sort By Event Type             Event Type
Sort By Severity               Severity
Sort By Source                 Source
Sort By SubComponent           SubComponent
Sort By User                   User

*** Keywords ***
Apply Sort and Confirm Events Present
    [Arguments]  ${value}
    Confirm Events Present
    Confirm Sort Not Applied
    Add Sort  ${value}
    Confirm Sort Applied
    Confirm Events Present
    Remove Sort  ${value}
    Confirm Sort Not Applied
    Confirm Events Present
