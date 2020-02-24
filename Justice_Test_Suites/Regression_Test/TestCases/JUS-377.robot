*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-377:  CSV and PDF Download for All Filtered Rows is a no-op.

Suite Setup      Log In and Navigate to Devices Tab
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm CSV All Filtered Rows
    Download CSV All Filtered Rows
    Wait Until Page Contains  Download Complete

Confirm PDF All Filtered Rows
    Download PDF All Filtered Rows
    Wait Until Page Contains  Download Complete


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
