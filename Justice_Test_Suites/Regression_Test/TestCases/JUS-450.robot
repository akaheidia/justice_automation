*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-450: Usability - XMC Data Pump options: changing values requires server restart.

Suite Setup     XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown  XMC Log Out and Close Browser

*** Test Cases ***
Confirm User Informed About Server Restart Via Label
    XMC Navigate To Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    XMC Select Options Tree Node  Data Pump
    XMC Confirm Page Contains Text  Server may need to be restarted
    XMC Set Option Value Data Pump Enable Sharing

Confirm User Informed About Server Restart When Changing Host
    XMC Set Option Value Data Pump Host  1.2.3.4
    XMC Wait For Save Button To Be Enabled
    XMC Options Click Save
    XMC Confirm Options Save Warnings Dialog Present
    XMC Options Save Warnings Dialog Click No

Confirm User Informed About Server Restart When Changing Port
    XMC Set Option Value Data Pump Port  5633
    XMC Wait For Save Button To Be Enabled
    XMC Options Click Save
    XMC Confirm Options Save Warnings Dialog Present
    XMC Options Save Warnings Dialog Click No

Confirm User Informed About Server Restart When Changing User
    XMC Set Option Value Data Pump Username  TEMP
    XMC Wait For Save Button To Be Enabled
    XMC Options Click Save
    XMC Confirm Options Save Warnings Dialog Present
    XMC Options Save Warnings Dialog Click No

Confirm User Informed About Server Restart When Changing Password
    XMC Set Option Value Data Pump Password  TEMP
    XMC Wait For Save Button To Be Enabled
    XMC Options Click Save
    XMC Confirm Options Save Warnings Dialog Present
    XMC Options Save Warnings Dialog Click No
