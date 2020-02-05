*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Monitoring Map page.

Suite Setup      Open Browser and Log In  ${URL}  ${BROWSER}  ${USERNAME}  ${PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Verify Navigation Menu
    Click Monitor
    Click Map Slider
    Confirm Map Page Loaded
