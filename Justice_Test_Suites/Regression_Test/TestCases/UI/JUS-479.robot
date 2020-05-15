*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-479: Usability: No indication that data/grid sort is applied.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Table Data Sort Indicator
    Confirm Sort Not Applied
    Add Sort  IP Address
    Add Sort  Name
    Add Sort  Server:Site
    Remove Sort  IP Address
    Confirm Sort Applied
    Remove Sort  Server:Site
    Confirm Sort Applied
    Remove Sort  Name
    Confirm Sort Not Applied
