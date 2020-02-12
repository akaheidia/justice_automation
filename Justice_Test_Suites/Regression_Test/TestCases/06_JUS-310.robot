*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-310:  Deleting Device in XMC does not remove it from Justice UI.

*** Variables ***
${device_ip}    10.54.142.12

*** Test Cases ***
Create Device In XMC
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Click Devices Devices Tab
    XMC Create Device  ${device_ip}  public_v1_Profile  TestDevice
    XMC Log Out and Close Browser

Confirm Device Added To Justice
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Filter Icon
    Confirm Filters Panel Visible
    Confirm Servers and Sites Filter Expanded
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
    Confirm Table Contains Device  ${device_ip}
    Log Out and Close Browser

Delete Device From XMC
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Click Devices Devices Tab
    XMC Confirm Device In Table  ${device_ip}
    XMC Delete Device  ${device_ip}
    XMC Refresh Devices Table
    XMC Confirm Device Not In Table  ${device_ip}
    XMC Log Out and Close Browser

Confirm Device Removed From Justice
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Filter Icon
    Confirm Filters Panel Visible
    Confirm Servers and Sites Filter Expanded
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
    Confirm Table Does Not Contain Device  ${device_ip}
    Log Out and Close Browser
