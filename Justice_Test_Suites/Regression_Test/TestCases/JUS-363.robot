*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-363: Sites - Filters: Issues with duplicate Site names between servers.
Suite Setup      Initialize Test
Suite Teardown   Tear Down Test

*** Variables ***
${site_name}    Duplicate Site

*** Test Cases ***
Confirm Duplicate Sites Present Between Servers
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded

    Expand Servers and Sites Tree Node  ${XMC_HOSTNAME}
    Confirm Filter Panel Contains Site  ${site_name}
    Collapse Servers and Sites Tree Node  ${XMC_HOSTNAME}

    Expand Servers and Sites Tree Node  ${XMC_2_HOSTNAME}
    Confirm Filter Panel Contains Site  ${site_name}
    Collapse Servers and Sites Tree Node  ${XMC_2_HOSTNAME}

Confirm Duplicate Site Selection Is Specific To Server
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded

    Expand Servers and Sites Tree Node  ${XMC_HOSTNAME}
    Select Servers and Sites Site Tree Node  ${site_name}
    Confirm Site Selected  ${site_name}
    Collapse Servers and Sites Tree Node  ${XMC_HOSTNAME}

    Expand Servers and Sites Tree Node  ${XMC_2_HOSTNAME}
    Confirm Site Not Selected  ${site_name}


*** Keywords ***
Initialize Test
    Set Up XMC Sites
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded

Tear Down Test
    Log Out and Close Browser
    Clean Up XMC Sites

Set Up XMC Sites
    Create Site In XMC  ${XMC_URL}  ${XMC_USERNAME}  ${XMC_PASSWORD}  ${site_name}
    Create Site In XMC  ${XMC_2_URL}  ${XMC_2_USERNAME}  ${XMC_2_PASSWORD}  ${site_name}

Clean Up XMC Sites
    Delete Site From XMC  ${XMC_URL}  ${XMC_USERNAME}  ${XMC_PASSWORD}  ${site_name}
    Delete Site From XMC  ${XMC_2_URL}  ${XMC_2_USERNAME}  ${XMC_2_PASSWORD}  ${site_name}

Create Site In XMC
    [Arguments]  ${xmc}  ${username}  ${pwd}  ${site_name}
    XMC Open Browser and Log In  ${xmc}  ${BROWSER}  ${username}  ${pwd}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Create Site  ${site_name}
    XMC Log Out and Close Browser

Delete Site From XMC
    [Arguments]  ${xmc}  ${username}  ${pwd}  ${site_name}
    XMC Open Browser and Log In  ${xmc}  ${BROWSER}  ${username}  ${pwd}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Delete Site  ${site_name}
    XMC Log Out and Close Browser
