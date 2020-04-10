*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-345: LOGI Changing the filter value w/o notifying user leads to no data.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Filter Panel Remains Filtered If Drill Down
    Click Reports
    sleep  2 seconds
    Confirm Reports Page Loaded
    Show Reports Filter Panel
    Set Reports Filter Device Types  B-Series,C-Series,Wireless Controller
    Apply Reports Filter
    Confirm Reports Filter Does Not Contain All Device Types
    Click Network Scorecard Site Availability Drilldown
    Confirm Reports Filter Does Not Contain All Device Types

Confirm Filter Panel Resets If Select New Report
    Navigate to Network Scorecard Report
    Show Reports Filter Panel
    Confirm Reports Filter Contains All Device Types
