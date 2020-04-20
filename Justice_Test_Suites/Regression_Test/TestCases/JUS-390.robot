*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-390: End system table shows error message.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm End-System Report Does Not Result In Error
    Navigate to Reports
    sleep  3 seconds
    Navigate to Network Summary Report
    sleep  2 seconds
    Confirm Network Summary Reports Page Title
    sleep  2 seconds
    Show Reports Filter Panel
    Set Reports Filter Time Range  Custom
    Set Reports Filter Custom Start Date  2/26/2020
    Set Reports Filter Custom End Date    2/27/2020
    Apply Reports Filter
    sleep  2 seconds
#    Click End System Pie Slice Drilldown  Windows
#    Click End System Types Drilldown
#    sleep  2 seconds
