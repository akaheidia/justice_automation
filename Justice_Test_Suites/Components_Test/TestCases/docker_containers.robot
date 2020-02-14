*** Settings ***
Library   SSHLibrary
Resource  ../Resources/AllResources.robot

Documentation   This test suite verifies all expected docker containers are present.

Suite Setup     Open Connection and Log In
Suite Teardown  Close All Connections

*** Variables ***
${HOST}         ${JUS_HOST_IP}
${USERNAME}     ${JUS_USERNAME}
${PASSWORD}     ${JUS_PASSWORD}

*** Test Cases ***
Execute Command and Verify Output
    ${docker_output}=  Execute Command  docker ps
    Log             ${docker_output}
    Should Contain  ${docker_output}  justice_justice-ui_1
    Should Contain  ${docker_output}  justice_elasticsearch_1
    Should Contain  ${docker_output}  justice_redis_1
    Should Contain  ${docker_output}  justice_nginx_1
    Should Contain  ${docker_output}  justice_rabbitmq_1
    Should Contain  ${docker_output}  justice_justice-auth_1
    Should Contain  ${docker_output}  justice_postgres_1
    Should Contain  ${docker_output}  justice_justice-xmc-messages_1

*** Keywords ***
Open Connection and Log In
    Open Connection   ${HOST}
    ${login_output}=  SSHLibrary.Login   ${USERNAME}  ${PASSWORD}
    Log               ${login_output}
    Should Contain    ${login_output}  Justice Server Appliance
