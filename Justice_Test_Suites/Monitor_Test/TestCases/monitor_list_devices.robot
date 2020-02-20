*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Devices tab of the Monitor List page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser
Test Setup       Navigate To Devices Tab

*** Test Cases ***

Confirm Download Menus
    Download CSV Visible Rows
    Download CSV All Rows
    Download CSV All Filtered Rows
    Download PDF Visible Rows
    Download PDF All Rows
    Download PDF All Filtered Rows

*** Keywords ***
Navigate To Devices Tab
    Click Monitor
    Click List Slider
    Click Devices Tab
    Confirm Devices Tab Selected
