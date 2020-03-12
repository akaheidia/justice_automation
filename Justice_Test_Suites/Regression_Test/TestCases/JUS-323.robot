*** Settings ***
Library   SSHLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-323: NullPointerException in server.log (XMC).

Suite Teardown  Close All Connections

*** Test Cases ***
Confirm XMC Server Log Does Not Contain a NullPointerException
    XMC Confirm Server Log Does Not Contain Message  ${XMC_HOST_IP}  ${XMC_USERNAME}  ${XMC_PASSWORD}  ${XMC_SERVER_LOG}  NullPointerException
