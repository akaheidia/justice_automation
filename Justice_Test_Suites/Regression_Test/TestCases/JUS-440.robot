*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-440: Usability - XMC Data Pump options: RabbitMQ URI should only be enabled when MOM Enabled.

Suite Setup      XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown   XMC Log Out and Close Browser

*** Test Cases ***

Confirm XMC Data Pump Option Enabled State
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    XMC Select Options Tree Node  XMC Data Pump

    XMC Set Option Value XMC Data Pump MoM Disabled
    XMC Confirm Option Disabled XMC Data Pump Host
    XMC Confirm Option Disabled XMC Data Pump Port
    XMC Confirm Option Disabled XMC Data Pump User
    XMC Confirm Option Disabled XMC Data Pump Password
    XMC Confirm Option Disabled XMC Data Pump Queue Add Delay
    XMC Confirm Option Disabled XMC Data Pump Queue Add Service Period
    XMC Confirm Option Disabled XMC Data Pump Max Action Queue Size
    XMC Confirm Option Disabled XMC Data Pump Max Actions Queueable
    XMC Confirm Option Disabled XMC Data Pump Max Actions Serviced

    XMC Set Option Value XMC Data Pump MoM Enabled
    XMC Confirm Option Enabled XMC Data Pump Host
    XMC Confirm Option Enabled XMC Data Pump Port
    XMC Confirm Option Enabled XMC Data Pump User
    XMC Confirm Option Enabled XMC Data Pump Password
    XMC Confirm Option Enabled XMC Data Pump Queue Add Delay
    XMC Confirm Option Enabled XMC Data Pump Queue Add Service Period
    XMC Confirm Option Enabled XMC Data Pump Max Action Queue Size
    XMC Confirm Option Enabled XMC Data Pump Max Actions Queueable
    XMC Confirm Option Enabled XMC Data Pump Max Actions Serviced
