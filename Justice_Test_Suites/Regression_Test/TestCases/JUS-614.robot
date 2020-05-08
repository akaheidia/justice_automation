*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-614: Add network summary and analytics summary charts as self service visual.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Network Summary and Analytics Summary Charts Available In Visual Gallery
    Navigate to Reports
    Click Reports Add Button
    Click Add New Report
    Confirm Self Service Report Page Title
    Self Service Report Add New Visual
    Self Service Report Confirm Visual Gallery Present
    sleep  2 seconds
    Self Service Report Select Gallery Type  Network Statistics
    sleep  1 second
    Confirm Self Service Report Gallery Contains Component  Site Availability
    Confirm Self Service Report Gallery Contains Component  Device Availability
    Confirm Self Service Report Gallery Does Not Contain Component  Top Applications by Clients
    Self Service Report Select Gallery Type  Analytics Statistics
    sleep  1 second
    Confirm Self Service Report Gallery Contains Component  Top Applications by Clients
    Confirm Self Service Report Gallery Contains Component  Top Applications by Volume
    Confirm Self Service Report Gallery Does Not Contain Component  Site Availability

Confirm Network Summary and Analytics Summary Charts Can Be Added to Report
    Self Service Report Set Find Text  Top Applications by Clients
    sleep  1 second
    Self Service Report Gallery Click Add  Top Applications by Clients
    Self Service Report Set Find Text  ${empty}
    Self Service Report Select Gallery Type  Network Statistics
    Self Service Report Set Find Text  Site Availability
    sleep  1 second
    Self Service Report Gallery Click Add  Site Availability
    Self Service Report Gallery Click Done
    sleep  5 seconds
    Confirm Self Service Report Contains Component  Top Applications by Clients
    Confirm Self Service Report Contains Component  Site Availability
    Confirm Self Service Report Does Not Contain Component  Top Applications by Volume
    Confirm Self Service Report Does Not Contain Component  Device Availability
