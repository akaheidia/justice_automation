*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Reports Top N Wireless Clients page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Page Loads
    Click Reports
    Confirm Reports Page Loaded
    Open Sidebar Menu
    Expand Reports Tree Reports Node
    Expand Reports Tree Top N Node
    Click Top N Top APs By Clients Reports Menu
    Confirm Top N Top APs By Clients Reports Page Title