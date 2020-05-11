*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-708: Reports - Self Service: Select Category pop-up hiding issue.

Suite Setup      Open Browser and Log In and Create Self Service Report
Suite Teardown   Delete Self Service Report and Log Out and Close Browser

*** Variables ***
${report_name}      Test Report
${report_category}  Custom Reports

*** Test Cases ***
Confirm Select Category Dialog Is Accessible
    Confirm Reports Page Loaded
    Show Reports Sidebar Menu
    Click Self Service Report Menu  ${report_name}
    sleep  1 second
    Confirm Self Service Select Category Dialog Visible
    Self Service Select Category  ${report_category}
    Self Service Select Category Click Save
    sleep  2 seconds

Confirm Self Service Report In Correct Category
    Confirm Reports Page Loaded
    Show Reports Sidebar Menu
    Confirm Self Service Report In Category  ${report_name}  ${report_category}
    Confirm Self Service Report Not In Category  ${report_name}  Self Service Reports

*** Keywords ***
Open Browser and Log In and Create Self Service Report
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Create Self Service Report

Delete Self Service Report and Log Out and Close Browser
    Delete Self Service Report
    Log Out and Close Browser

Create Self Service Report
    Navigate to Reports
    Click Reports Add Button
    Click Add New Report
    Confirm Self Service Report Page Title
    Self Service Report Add New Visual
    Self Service Report Confirm Visual Gallery Present
    sleep  2 seconds
    Self Service Report Select Gallery Type  Network Statistics
    sleep  1 second
    Self Service Report Gallery Click Add  Site Availability
    Self Service Report Gallery Click Done
    sleep  5 seconds
    Confirm Self Service Report Contains Component  Site Availability
    Self Service Rename  ${report_name}
    Confirm Self Service Report Name  ${report_name}
    Self Service Click Go To Reports Button
    sleep  2 seconds

Delete Self Service Report
    Confirm Reports Page Loaded
    Show Reports Sidebar Menu
    Click Self Service Report Menu For Category  ${report_name}  ${report_category}
    sleep  1 second
    Self Service Delete
    sleep  3 seconds
