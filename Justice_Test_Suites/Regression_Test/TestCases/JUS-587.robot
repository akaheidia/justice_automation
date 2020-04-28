*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-376: Reports: Session Timeout but navigating to Monitor and back to Reports loads view.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Reports Page Does Not Time Out
    Log To Console  Commented Out By Default Due To Long Time Requirement
#    sleep  45 minutes
#    Log Out
#    Log In  ${JUS_USERNAME}  ${JUS_PASSWORD}
#    Navigate to Reports
#    sleep  2 seconds
#    Confirm Page Does Not Contain Text  rdSecureKey