*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-440: Usability - XMC Data Pump options: RabbitMQ URI should only be enabled when sharing is enabled.

Suite Setup      XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown   XMC Log Out and Close Browser

*** Test Cases ***

Confirm XMC Data Pump Option Enabled State
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    XMC Select Options Tree Node  Data Pump

    XMC Set Option Value Data Pump Disable Sharing
    XMC Confirm Option Disabled Data Pump Host
    XMC Confirm Option Disabled Data Pump Port
    XMC Confirm Option Disabled Data Pump User
    XMC Confirm Option Disabled Data Pump Password
    XMC Confirm Option Disabled Data Pump Queue Add Delay
    XMC Confirm Option Disabled Data Pump Queue Add Service Period
    XMC Confirm Option Disabled Data Pump Max Action Queue Size
    XMC Confirm Option Disabled Data Pump Max Actions Queueable
    XMC Confirm Option Disabled Data Pump Max Actions Serviced

    XMC Set Option Value Data Pump Enable Sharing
    XMC Confirm Option Enabled Data Pump Host
    XMC Confirm Option Enabled Data Pump Port
    XMC Confirm Option Enabled Data Pump User
    XMC Confirm Option Enabled Data Pump Password
    XMC Confirm Option Enabled Data Pump Queue Add Delay
    XMC Confirm Option Enabled Data Pump Queue Add Service Period
    XMC Confirm Option Enabled Data Pump Max Action Queue Size
    XMC Confirm Option Enabled Data Pump Max Actions Queueable
    XMC Confirm Option Enabled Data Pump Max Actions Serviced
