*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Filter panel on the Reports page.

Suite Setup      Log In and Navigate to Reports
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Filter Panel Show and Hide Functionality
    Show Reports Filter Panel
    Confirm Reports Filter Panel Visible
    sleep  1 second
    Hide Reports Filter Panel
    Confirm Reports Filter Panel Not Visible

Change Time Range to Last Hour
    Show Reports Filter Panel
    Confirm Reports Filter Panel Visible
    Confirm Reports Filter Time Range Value  Last 24 Hours
    Set Reports Filter Time Range  Last Hour
    Apply Reports Filter
    Confirm Reports Filter Time Range Value  Last Hour
    Hide Reports Filter Panel

*** Keywords ***
Log In and Navigate to Reports
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Navigate to Reports
