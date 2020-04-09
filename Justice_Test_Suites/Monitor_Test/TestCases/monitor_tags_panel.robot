*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Tags panel on the Monitor page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${tag_name}  Test Tag 1
${tag_desc}  Description for test tag

*** Test Cases ***
Tags Panel Show and Hide Functionality
    Show Tags Panel
    Confirm Tags Panel Visible
    Hide Tags Panel
    Confirm Tags Panel Not Visible

Tags Panel Close Functionality
    Show Tags Panel
    Tags Panel Click Close
    Confirm Tags Panel Not Visible

Tags Panel Add Tag Functionality
    Show Tags Panel
    Confirm Tags Panel Is Empty
    Tags Panel Click Add
    Add Tag Set Name  ${tag_name}
    Add Tag Set Description  ${tag_desc}
    Add Tag Select Star
    Add Tag Click Save
    Confirm Tags Panel Is Not Empty

Tags Panel Manage Tags Functionality
    Tags Panel Click Manage
    Confirm Manage Tags Panel Is Not Empty
    Confirm Manage Tags Panel Contains Tag  ${tag_name}
    Manage Tags Select Tag  ${tag_name}
    Manage Tags Click Delete
    Tag Confirm Delete Click Cancel
    Confirm Manage Tags Panel Contains Tag  ${tag_name}
    Manage Tags Expand Row  ${tag_name}
    sleep  1 second
    Manage Tags Collapse Row  ${tag_name}
    Manage Tags Select Tag  ${tag_name}
    Manage Tags Click Delete
    Tag Confirm Delete Click OK
    Confirm Manage Tags Panel Does Not Contain Tag  ${tag_name}
    Manage Tags Click Close
