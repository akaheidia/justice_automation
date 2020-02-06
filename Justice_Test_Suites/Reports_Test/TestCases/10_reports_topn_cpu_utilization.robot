*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Reports Top N CPU Utilization page.

Suite Setup      Open Browser and Log In  ${URL}  ${BROWSER}  ${USERNAME}  ${PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Page Loads
    Click Reports
    Confirm Reports Page Loaded
    Open Sidebar Menu
    Expand Reports Tree Reports Node
    Expand Reports Tree Top N Node
    Click Top N CPU Utilization Reports Menu
#    Confirm Top N CPU Utilization Reports Page Loaded
