*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-338: Usability: Report Sidebar Menu not expanded by default.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Reports Menus Are Expanded By Default
    Navigate To Reports
    Show Reports Sidebar Menu
    Confirm Reports Tree Reports Node Is Expanded
    Confirm Reports Tree Site Node Is Expanded
    Confirm Reports Tree Top N Node Is Expanded
    Confirm Reports Tree Analytics Node Is Expanded
