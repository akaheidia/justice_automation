*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-342: Usability: Clicking Tags or Filter icon should toggle visibility of panel.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Tag Test
    Show Tags Panel
    Confirm Tags Panel Visible
    sleep  1 second
    Hide Tags Panel
    Confirm Tags Panel Not Visible

Filter Test
    Show Filter Panel
    Confirm Filter Panel Visible
    sleep  1 second
    Hide Filter Panel
    Confirm Filter Panel Not Visible
