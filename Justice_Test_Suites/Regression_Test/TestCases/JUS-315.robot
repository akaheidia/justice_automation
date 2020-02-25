*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-315: Deleting Site in XMC does not remove it from Justice UI.

*** Variables ***
${site_name}    My_New_Test_Site

*** Test Cases ***
Create Site In XMC
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Create Site  ${site_name}
    XMC Log Out and Close Browser

Confirm Site Added To Justice
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Filter Icon
    Confirm Filters Panel Visible
    Confirm Servers and Sites Filter Expanded
    Expand Servers and Sites Tree Node  ${XMC_HOSTNAME}
    Confirm Filters Panel Contains Site  ${site_name}
    Log Out and Close Browser

Delete Site From XMC
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Delete Site  ${site_name}
    XMC Log Out and Close Browser

Confirm Site Removed From Justice
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Filter Icon
    Confirm Filters Panel Visible
    Confirm Servers and Sites Filter Expanded
    Expand Servers and Sites Tree Node  ${XMC_HOSTNAME}
    Confirm Filters Panel Does Not Contain Site  ${site_name}
    Log Out and Close Browser
