*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-449: Usability - XMC Data Pump options: RabbitMQ label is design-specific.

Suite Setup      XMC Open Browser and Log In  ${XMC_2_URL}  ${BROWSER}  ${XMC_2_USERNAME}  ${XMC_2_PASSWORD}
Suite Teardown   XMC Log Out and Close Browser

*** Test Cases ***

Confirm XMC Data Pump Options for RabbitMQ URI are Split Into Components
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded

    XMC Select Options Tree Node  XMC Data Pump
    XMC Set Option Value XMC Data Pump MoM Enabled

    Page Should Contain  Message Broker
    XMC Confirm Page Does Not Contain Text  RabbitMQ
