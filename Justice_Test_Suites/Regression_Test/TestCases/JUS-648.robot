*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-648: Reports - Filters: Time Range not reset when using menu to select new report.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Filter Panel Remains Filtered On Time Range If Drill Down
    Click Reports
    sleep  2 seconds
    Confirm Reports Page Loaded
    Show Reports Filter Panel
    Set Reports Filter Time Range  Last Hour
    Apply Reports Filter
    Confirm Reports Filter Time Range Value  Last Hour
    Click Network Scorecard Site Availability Drilldown
    Confirm Reports Filter Time Range Value  Last Hour
    Click Breadcrumb  Home
    Confirm Reports Filter Time Range Value  Last Hour

Confirm Filter Panel Resets Time Range To Default If Select New Report
    Navigate to Network Scorecard Report
    Show Reports Filter Panel
    Confirm Reports Filter Time Range Value  Last 24 Hours
