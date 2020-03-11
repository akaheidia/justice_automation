*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-447: Usability - XMC Data Pump options: new fields not at default values at startup.

Suite Setup     XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown  XMC Log Out and Close Browser

*** Test Cases ***
Confirm XMC Data Pump Options Default Values
    XMC Navigate To Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    XMC Select Options Tree Node  XMC Data Pump
    XMC Options Click Restore Defaults

    XMC Confirm Option Value XMC Data Pump MoM Disabled

    XMC Set Option Value XMC Data Pump MoM Enabled

    XMC Confirm Option Value XMC Data Pump Domain Node Type  1

    XMC Confirm Option Value XMC Data Pump Host  127.0.0.1
    XMC Confirm Option Value XMC Data Pump Port  5672
    XMC Confirm Option Value XMC Data Pump Username  guest
    XMC Confirm Option Value XMC Data Pump Password  extreme

    XMC Confirm Option Value XMC Data Pump Queue Add Delay  3
    XMC Confirm Option Value XMC Data Pump Queue Add Service Period  2
    XMC Confirm Option Value XMC Data Pump Max Action Queue Size  10000
    XMC Confirm Option Value XMC Data Pump Max Actions Queueable  5000
    XMC Confirm Option Value XMC Data Pump Max Actions Serviced  500
