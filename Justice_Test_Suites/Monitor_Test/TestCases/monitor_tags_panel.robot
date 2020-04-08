*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Tags panel on the Monitor page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Tags Panel Show and Hide Functionality
    Show Tags Panel
    Confirm Tags Panel Visible
    Hide Tags Panel
    Confirm Tags Panel Not Visible

Confirm Tags Panel Close Functionality
    Show Tags Panel
    Tags Click Close
    Confirm Tags Panel Not Visible

Confirm Tags Panel Add Functionality
    Show Tags Panel
    Tags Click Add
    Add Tag Set Name  Test Tag 1
    Add Tag Set Description  Just a test
    Add Tag Select Star
    Add Tag Click Save
