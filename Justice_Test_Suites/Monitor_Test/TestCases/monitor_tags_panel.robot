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
    Tags Click Add
    Add Tag Set Name  ${tag_name}
    Add Tag Set Description  ${tag_desc}
    Add Tag Select Star
    Add Tag Click Save

Tags Panel Manage Tags Functionality
    Tags Click Manage
    Manage Tags Select Tag  ${tag_name}
    sleep  3 seconds
    Manage Tags Click Close
#    Manage Tags Click Delete
