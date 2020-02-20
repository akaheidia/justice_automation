*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-380:  Usability: Download menu should close when choice selected.

Suite Setup      Log In and Navigate to Devices Tab
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Download Menu Closes After CSV Visible Rows
    Download CSV Visible Rows
    Confirm Download Menu Closed

Confirm Download Menu Closes After CSV All Rows
    Download CSV All Rows
    Confirm Download Menu Closed

Confirm Download Menu Closes After CSV All Filtered Rows
    Download CSV All Filtered Rows
    Confirm Download Menu Closed

Confirm Download Menu Closes After PDF Visible Rows
    Download PDF Visible Rows
    Confirm Download Menu Closed

Confirm Download Menu Closes After PDF All Rows
    Download PDF All Rows
    Confirm Download Menu Closed

Confirm Download Menu Closes After PDF All Filtered Rows
    Download PDF All Filtered Rows
    Confirm Download Menu Closed


*** Keywords ***
Log In and Navigate to Devices Tab
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Click List Slider
    Click Devices Tab
    Confirm Devices Tab Selected
    Set Server Filter

Set Server Filter
    Click Filter Icon
    Confirm Filters Panel Visible
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
