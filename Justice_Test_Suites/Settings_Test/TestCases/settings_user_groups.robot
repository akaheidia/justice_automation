*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Settings User Groups page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Page Loads
    Click Settings
    Confirm Settings Page Loaded
    Click User Groups
    Confirm User Groups Page Loaded

Select NetSight Administrator User Group
    Settings Select User Group  ${XMC_HOSTNAME}  NetSight Administrator
    Confirm Settings User Group Edit Button Not Present

Select Custom User Group
    Settings Select User Group  ${XMC_HOSTNAME}  Custom Group
    sleep  1 second
    Confirm Settings User Group Edit Button Present
    Settings User Group Click Edit
    Confirm Settings User Group Cancel Button Present
    Confirm Settings User Group Save Button Present
    Settings User Group Click Cancel
