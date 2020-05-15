*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-620: Tags: Delete Tag confirmation dialog has button "Ok" but should be "OK".

Suite Setup     Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown  Log Out and Close Browser

*** Variables ***
${test_tag}  Test Tag

*** Test Cases ***
Confirm Delete Tags Confirmation Button From Tag Details Dialog
    Tags Panel Create Tag  ${test_tag}
    Tags Panel Select Tag  ${test_tag}
    Confirm Edit Tag Dialog Visible
    Edit Tag Click Delete
    Edit Tag Confirm Delete Tag Click OK
    Confirm Tags Panel Does Not Contain Tag  ${test_tag}

Confirm Delete Tag Confirmation Button From Manage Tags Dialog
    Tags Panel Create Tag  ${test_tag}
    Tags Panel Click Manage
    Confirm Manage Tags Panel Contains Tag  ${test_tag}
    Manage Tags Select Tag  ${test_tag}
    Manage Tags Click Delete
    Manage Tags Confirm Delete Tags Click OK
    Confirm Manage Tags Panel Does Not Contain Tag  ${test_tag}
    Manage Tags Click Close
    Confirm Tags Panel Does Not Contain Tag  ${test_tag}
    Hide Tags Panel
