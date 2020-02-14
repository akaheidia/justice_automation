*** Settings ***
Library   SSHLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-323:  NullPointerException in server.log (XMC).

Suite Setup     Open Connection and Log In
Suite Teardown  Close All Connections

*** Variables ***
${HOST}         ${XMC_HOST_IP}
${USERNAME}     ${XMC_USERNAME}
${PASSWORD}     ${XMC_PASSWORD}

*** Test Cases ***
Execute Command and Verify Output
    ${command_output}=  Execute Command  grep NullPointerException ${XMC_SERVER_LOG}
    Log  ${command_output}
    Should Not Contain  ${command_output}  NullPointerException

*** Keywords ***
Open Connection and Log In
    Open Connection    ${HOST}
    ${login_output}=  SSHLibrary.Login   ${USERNAME}  ${PASSWORD}
    Log  ${login_output}
    Should Contain  ${login_output}  Management Center
