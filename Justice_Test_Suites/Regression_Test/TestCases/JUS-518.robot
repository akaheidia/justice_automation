*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-518: XMC Data Pump Options: Domain Node Type not updated in postgres.

Suite Setup      XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown   XMC Log Out and Close Browser

*** Test Cases ***
Confirm Data Pump Option Does Not Include Domain Node Type
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    XMC Select Options Tree Node  Data Pump
    XMC Set Option Value Data Pump Enable Sharing
    Page Should Not Contain  Domain Node Type

Confirm domainnodetype Field present in NSJBoss.properties file
    XMC Confirm File Contains Value  ${XMC_HOST_IP}  ${XMC_USERNAME}  ${XMC_PASSWORD}  ${XMC_NSJBOSS_PROPERTIES}  extreme.domainnode.nodetype