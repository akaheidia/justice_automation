*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Reports Analytics Monthly Usage page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Page Loads
    Click Reports
    Confirm Reports Page Loaded
    Open Sidebar Menu
    Expand Reports Tree Reports Node
    Expand Reports Tree Analytics Node
    Click Analytics Monthly Usage Reports Menu
    Confirm Analytics Monthly Usage Reports Page Title
