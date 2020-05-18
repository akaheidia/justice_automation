*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-583: Tags - Usability: Ability to create tag from Add Devices/Ports To Tags panel.

Suite Setup     Log In and Navigate To Devices Page
Suite Teardown  Log Out and Close Browser

Test Setup      Open Add Device To Tag Panel
Test Teardown   Add Devices To Tag Click Close

*** Variables ***
${test_device}  10.54.142.10
${test_tag}     Test Tag

*** Test Cases ***
Confirm Refresh From Add Devices To Tag Panel
    Add Devices To Tag Click Refresh

Confirm Add From Add Devices To Tag Panel
    Add Devices To Tag Click Add
    Add Tag Set Name  ${test_tag}
    Add Tag Click Save
    Confirm Add Devices To Tag Panel Contains Tag  ${test_tag}

Confirm Manage From Add Devices To Tag Panel
    Add Devices To Tag Click Manage
    sleep  1 second
    Confirm Manage Tags Panel Contains Tag  ${test_tag}
    Manage Tags Select Tag  ${test_tag}
    sleep  1 second
    Manage Tags Click Delete
    Manage Tags Confirm Delete Tags Click OK
    Confirm Manage Tags Panel Does Not Contain Tag  ${test_tag}
    Manage Tags Click Close
    Confirm Add Devices To Tag Panel Does Not Contain Tag  ${test_tag}

*** Keywords ***
Log In and Navigate To Devices Page
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Devices Tab

Open Add Device To Tag Panel
    Search Field Enter Text  ${test_device}
    Confirm Device In Table  ${test_device}
    Select Device In Table   ${test_device}
    Click Add Devices To Tag
    Confirm Add Devices To Tag Panel Visible
