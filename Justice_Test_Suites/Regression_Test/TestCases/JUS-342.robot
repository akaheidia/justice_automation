*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-342: Usability: Clicking Tags or Filter icon should toggle visibility of panel.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Tag Test
    Click Tag Icon
    Confirm Tags Panel Visible
    sleep  1 second
    Click Tag Icon
    Confirm Tags Panel Not Visible

Filter Test
    Click Filter Icon
    Confirm Filters Panel Visible
    sleep  1 second
    Click Filter Icon
    Confirm Filters Panel Not Visible
