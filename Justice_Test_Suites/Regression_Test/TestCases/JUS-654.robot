*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-654: Edit Tag: Save button does not close dialog - spins forever.

Suite Setup     Log In and Navigate To Devices Page
Suite Teardown  Log Out and Close Browser

Test Setup      Create Test Tag
Test Teardown   Delete Test Tag

*** Variables ***
${test_tag}     Test Tag
${test_desc}    This is a tag used for testing purposes.
${new_desc}     This is a tag used for testing purposes and has been edited.

*** Test Cases ***
Confirm Edit Tag Save Button Works
    Show Tags Panel

    Tags Panel Select Tag  ${test_tag}
    Confirm Edit Tag Dialog Visible
    Confirm Edit Tag Dialog Name Value  ${test_tag}
    Confirm Edit Tag Dialog Star Not Selected
    Confirm Edit Tag Dialog Description Value  ${test_desc}
    Edit Tag Set Description  ${new_desc}
    Edit Tag Select Star
    Edit Tag Click Save
    Confirm Edit Tag Dialog Not Visible

    Tags Panel Select Tag  ${test_tag}
    Confirm Edit Tag Dialog Name Value  ${test_tag}
    Confirm Edit Tag Dialog Star Selected
    Confirm Edit Tag Dialog Description Value  ${new_desc}
    Edit Tag Click Save
    Confirm Edit Tag Dialog Not Visible

    Hide Tags Panel

*** Keywords ***
Log In and Navigate To Devices Page
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Devices Tab

Create Test Tag
    Show Tags Panel
    Tags Panel Click Add
    Add Tag Set Name  ${test_tag}
    Add Tag Set Description  ${test_desc}
    Add Tag Click Save
    Confirm Tags Panel Contains Tag  ${test_tag}

Delete Test Tag
    Show Tags Panel
    Tags Panel Select Tag  ${test_tag}
    Edit Tag Click Delete
    Edit Tag Confirm Delete Tag Click OK
    Confirm Tags Panel Does Not Contain Tag  ${test_tag}
