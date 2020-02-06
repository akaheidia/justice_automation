*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Reports Site CPU Utilization page.

Suite Setup      Open Browser and Log In  ${URL}  ${BROWSER}  ${USERNAME}  ${PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Page Loads
    Click Reports
    Confirm Reports Page Loaded
    Open Sidebar Menu
    Expand Reports Tree Reports Node
    Expand Reports Tree Site Node
    Click Site CPU Utilization Reports Menu
    Confirm Site CPU Utilization Reports Page Loaded
