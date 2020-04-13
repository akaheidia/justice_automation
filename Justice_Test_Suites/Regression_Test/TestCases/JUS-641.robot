*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-641: Tags - Usability: Manage Tags panel lacks color in Add icon; inconsistent with other panels.

Suite Setup     Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown  Log Out and Close Browser

*** Test Cases ***
Confirm Manage Tags Dialog Contains Blue Add Icon
    Show Tags Panel
    Tags Panel Click Manage
    Page Should Contain Element  xpath://app-manage-tags-dialog//mat-icon[@fonticon='ei-add_circle']
    sleep  1 second
    Manage Tags Click Close
    Hide Tags Panel
