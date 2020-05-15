*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-613: Settings - User Groups: table selection not removed when user clicks Close (question on why Close button exists).

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Test Not Supported
    Log To Console  Settings Page Has Been Removed - Test Commented Out Until It Is Added Back

#Confirm Close Button Not Present In User Group Details Panel
#    Click Settings
#    Confirm Settings Page Loaded
#    Click User_Groups
#    Confirm User_Groups Page Loaded
#    Settings Select User Group  ${XMC_HOSTNAME}  NetSight Administrator
#    Confirm Settings User Group Close Button Not Present
#    Settings Select User Group  ${XMC_HOSTNAME}  Custom Group
#    Confirm Settings User Group Close Button Not Present
