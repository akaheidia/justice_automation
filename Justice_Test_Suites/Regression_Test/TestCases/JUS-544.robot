*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-544: Tags: "unknown" listed for CREATED BY and LAST EDIT BY columns.

Suite Setup     Log In and Navigate To Devices Page
Suite Teardown  Log Out and Close Browser

Test Setup      Create Test Tag
Test Teardown   Delete Test Tag

*** Variables ***
${test_tag}     Test Tag

*** Test Cases ***
Confirm Manage Tags Shows Correct Author
    Show Tags Panel
    Tags Panel Click Manage
    Confirm Manage Tags Panel Contains Tag  ${test_tag}
    Confirm Manage Tags Panel Tag Created By  ${test_tag}  ${JUS_USERNAME}
    Confirm Manage Tags Panel Tag Last Edit By  ${test_tag}  ${JUS_USERNAME}
    Manage Tags Click Close

*** Keywords ***
Log In and Navigate To Devices Page
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Devices Tab

Create Test Tag
    Show Tags Panel
    Tags Panel Click Add
    Add Tag Set Name  ${test_tag}
    Add Tag Click Save
    Confirm Tags Panel Contains Tag  ${test_tag}

Delete Test Tag
    Show Tags Panel
    Tags Panel Select Tag  ${test_tag}
    Edit Tag Click Delete
    Edit Tag Confirm Delete Tag Click OK
    Confirm Tags Panel Does Not Contain Tag  ${test_tag}
