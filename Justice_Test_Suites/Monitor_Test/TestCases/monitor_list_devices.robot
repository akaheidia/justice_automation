*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Devices tab of the Monitor List page.

Suite Setup      Log In and Navigate to Devices Tab
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Download Menus
    Set Server Filter
    Download CSV Visible Rows
    Download CSV All Rows
    Download CSV All Filtered Rows
    Download PDF Visible Rows
    Download PDF All Rows
    Download PDF All Filtered Rows

*** Keywords ***
Log In and Navigate to Devices Tab
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Click List Slider
    Click Devices Tab
    Confirm Devices Tab Selected

Set Server Filter
    Click Filter Icon
    Confirm Filters Panel Visible
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
