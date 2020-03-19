*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-481: Events: Sorting via popup for Severity results in empty table.

Suite Setup      Log In and Navigate to Events Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Sorting By Severity Does Not Remove All Events From Table
    Confirm Events Present
    Confirm Sort Not Applied
    Add Sort  Severity
    Confirm Sort Applied
    Confirm Events Present
    Remove Sort  Severity
    Confirm Sort Not Applied
    Confirm Events Present
