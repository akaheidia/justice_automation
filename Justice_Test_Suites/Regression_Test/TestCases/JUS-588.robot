*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-588: Verbose messaging in server.log upon authentication.

Suite Teardown  Close All Connections

*** Variables ***
${xmc_ip}         ${XMC_HOST_IP}
${xmc_user}       ${XMC_USERNAME}
${xmc_pwd}        ${XMC_PASSWORD}
${xmc_log}        ${XMC_SERVER_LOG}

*** Test Cases ***
Log In To XMC
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    XMC Log Out and Close Browser

Log In To Justice
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Log Out and Close Browser

Confirm Verbose Log In Message Not Seen
    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Name:${xmc_user}
