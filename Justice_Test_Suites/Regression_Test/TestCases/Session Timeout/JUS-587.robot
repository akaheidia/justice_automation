*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-587: Reports: rdSecureKey Error after being idle for a while, logging in/out, then accessing reports.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Reports Page Does Not Have Error After Being Idle
    sleep  45 minutes
    Log Out
    Log In  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Navigate to Reports
    sleep  2 seconds
    Confirm Page Does Not Contain Text  rdSecureKey
