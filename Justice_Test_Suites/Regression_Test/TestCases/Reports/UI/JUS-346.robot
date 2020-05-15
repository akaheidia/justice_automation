*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-346: Usability: LOGI right and left panels shouldn't close.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Sidebar Menu Closes When Filter Panel Opened
    Navigate to Reports
    Show Reports Sidebar Menu
    Confirm Reports Sidebar Menu Visible
    Show Reports Filter Panel
    Confirm Reports Sidebar Menu Not Visible

Confirm Filter Panel Closes When Sidebar Menu Opened
    Show Reports Sidebar Menu
    Confirm Reports Filter Panel Not Visible

Confirm Sidebar Menu Closes When Report Menu Selected
    Navigate to Site Availability Report
    sleep  2 seconds
    Confirm Reports Sidebar Menu Not Visible

Confirm Filter Panel Remains Open If Opened And Drill Down
    Show Reports Filter Panel
    Confirm Reports Filter Panel Visible
    Site Availability Drill Into Site  ${site_device_down}
    Confirm Reports Filter Panel Visible

Confirm Filter Panel Remains Closed If Closed And Drill Down
    Click Breadcrumb  Site Availability
    sleep  2 seconds
    Hide Reports Filter Panel
    Confirm Reports Filter Panel Not Visible
    Site Availability Drill Into Site  ${site_device_down}
    Confirm Reports Filter Panel Not Visible
