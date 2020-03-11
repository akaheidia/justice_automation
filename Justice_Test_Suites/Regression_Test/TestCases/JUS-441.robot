*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-441: Usability - XMC Data Pump options: RabbitMQ URI field needs to aid user in field contents.

Suite Setup      XMC Open Browser and Log In  ${XMC_2_URL}  ${BROWSER}  ${XMC_2_USERNAME}  ${XMC_2_PASSWORD}
Suite Teardown   XMC Log Out and Close Browser

*** Test Cases ***

Confirm XMC Data Pump Options for RabbitMQ URI are Split Into Components
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded

    XMC Select Options Tree Node  XMC Data Pump
    XMC Set Option Value XMC Data Pump MoM Enabled

    XMC Set Option Value XMC Data Pump Host  ${JUS_HOST_IP}
    XMC Set Option Value XMC Data Pump Port  5672
    XMC Set Option Value XMC Data Pump Username  guest
    XMC Set Option Value XMC Data Pump Password  extreme

    XMC Confirm Option Value XMC Data Pump Host  ${JUS_HOST_IP}
    XMC Confirm Option Value XMC Data Pump Port  5672
    XMC Confirm Option Value XMC Data Pump Username  guest
    XMC Confirm Option Value XMC Data Pump Password  extreme
