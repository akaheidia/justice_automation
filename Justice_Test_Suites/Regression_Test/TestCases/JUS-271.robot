*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-271: Token expiration should redirect to login page.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Close Browser


*** Test Cases ***
Confirm Session Timeout Returns to Login Page
    Log To Console  Commented Out By Default Due To Long Time Requirement
#    Confirm Devices Tab Selected
#    sleep  8 hours
#    Click Alarms Tab
#    Confirm Login Page Loaded
