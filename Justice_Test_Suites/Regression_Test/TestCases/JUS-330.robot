*** Settings ***
Library   SSHLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-330:  Docker containers should include elasticsearch image.

Suite Setup     Open Connection and Log In
Suite Teardown  Close All Connections

*** Variables ***
${HOST}         ${JUS_HOST_IP}
${USERNAME}     ${JUS_USERNAME}
${PASSWORD}     ${JUS_PASSWORD}

*** Test Cases ***
Execute Command and Verify Output
    ${output}=  Execute Command  docker ps
    Should Contain  ${output}  justice_elasticsearch_1

*** Keywords ***
Open Connection and Log In
    Open Connection    ${HOST}
    ${login_output}=  SSHLibrary.Login   ${USERNAME}  ${PASSWORD}
    Should Contain  ${login_output}  Justice Server Appliance
