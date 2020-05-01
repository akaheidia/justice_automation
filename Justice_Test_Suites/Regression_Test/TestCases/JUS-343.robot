*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-343: Back button does not work in LOGI.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Back Button Works
    Navigate to Network Summary Report
    Confirm Network Summary Reports Page Title
    Click Device Availability Drilldown
    sleep  2 seconds
    Confirm Top N Device Availability Report Page Title
    Go Back
    Confirm Network Summary Reports Page Title
