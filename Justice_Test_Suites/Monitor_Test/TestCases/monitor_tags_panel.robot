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
    Tags Click Close
    Confirm Tags Panel Not Visible

Tags Panel Add Tag Functionality
    Show Tags Panel
    Confirm Tags Panel Is Empty
    Tags Click Add
    Add Tag Set Name  ${tag_name}
    Add Tag Set Description  ${tag_desc}
    Add Tag Select Star
    Add Tag Click Save
    Confirm Tags Panel Is Not Empty

Tags Panel Manage Tags Functionality
    Tags Click Manage
    Confirm Manage Tags Dialog Is Not Empty
    Confirm Manage Tags Dialog Contains Tag  ${tag_name}
    Manage Tags Select Tag  ${tag_name}
    Manage Tags Click Delete
    Tag Confirm Delete Click Cancel
    Confirm Manage Tags Dialog Contains Tag  ${tag_name}
    Manage Tags Select Tag  ${tag_name}
    Manage Tags Click Delete
    Tag Confirm Delete Click OK
    Confirm Manage Tags Dialog Does Not Contain Tag  ${tag_name}
    Manage Tags Click Close
