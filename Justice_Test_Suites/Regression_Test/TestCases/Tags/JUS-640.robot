*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-640: Tags - Usability: Add Devices To Tags panel has no message like the other tags panels.

Suite Setup     Log In and Navigate To Devices Page
Suite Teardown  Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.10
${test_tag}     Test Tag

*** Test Cases ***
Confirm Add Devices To Tag Panel Contains Message When Empty
    Search Field Enter Text  ${test_device}
    Confirm Device In Table  ${test_device}
    Select Device In Table   ${test_device}
    Click Add Devices To Tag
    Confirm Add Devices To Tag Panel Visible
    Confirm Add Devices To Tag Panel Is Empty

Confirm Add Devices To Tag Panel Does Not Contain Message When Not Empty
    Add Devices To Tag Click Add
    Add Tag Set Name  ${test_tag}
    Add Tag Click Save
    Confirm Add Devices To Tag Panel Contains Tag  ${test_tag}
    Confirm Add Devices To Tag Panel Is Not Empty

Confirm Add Devices To Tag Panel Contains Message When Tags Deleted
    Add Devices To Tag Click Manage
    sleep  1 second
    Manage Tags Select Tag  ${test_tag}
    Manage Tags Click Delete
    Manage Tags Confirm Delete Tags Click OK
    Confirm Manage Tags Panel Is Empty
    Manage Tags Click Close
    Confirm Add Devices To Tag Panel Is Empty
    Add Devices To Tag Click Close

*** Keywords ***
Log In and Navigate To Devices Page
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Devices Tab
