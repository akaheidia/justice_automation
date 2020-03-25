*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-376: Reports: Session Timeout but navigating to Monitor and back to Reports loads view.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Reports Page Does Not Time Out
    Log To Console  Commented Out By Default Due To Long Time Requirement
#    Navigate to Network Summary Report
#    Confirm Network Summary Reports Page Title
#    sleep  35 minutes
#    Click Device Availability Drilldown
#    Confirm Top N Device Availability Reports Page Title
