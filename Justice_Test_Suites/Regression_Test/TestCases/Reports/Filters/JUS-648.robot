*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-648: Reports - Filters: Time Range not reset when using menu to select new report.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Filter Panel Remains Filtered On Time Range If Drill Down
    Click Reports
    sleep  3 seconds
    Confirm Reports Page Loaded
    Show Reports Filter Panel
    Set Reports Filter Time Range  Last Hour
    Apply Reports Filter
    sleep  1 second
    Confirm Reports Filter Time Range Value  Last Hour
    sleep  1 second
    Click Network Scorecard Site Availability Drilldown
    Confirm Reports Filter Time Range Value  Last Hour
    Site Availability Drill Into Site  ${site_device_down}
    Confirm Reports Filter Time Range Value  Last Hour

Confirm Filter Panel Remains Filtered On Time Range If Navigate With Breadcrumb
    Click Breadcrumb  Home
    Confirm Reports Filter Time Range Value  Last Hour

Confirm Filter Panel Resets Time Range To Default If Select New Report From Menu
    Navigate to Network Scorecard Report
    Show Reports Filter Panel
    Confirm Reports Filter Time Range Value  Last 24 Hours
