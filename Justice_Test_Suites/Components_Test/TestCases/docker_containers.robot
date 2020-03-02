*** Settings ***
Library   SSHLibrary
Resource  ../Resources/AllResources.robot

Documentation   This test suite verifies all expected docker containers are present.

Suite Setup     Initialize SSH Connection
Suite Teardown  Close SSH Connection

*** Test Cases ***
Execute Command and Verify Output
    ${docker_output}=  Execute Command  docker ps
    Log             ${docker_output}
    Should Contain  ${docker_output}  justice_elasticsearch_1
    Should Contain  ${docker_output}  justice_logstash_1
    Should Contain  ${docker_output}  justice_nginx_1
    Should Contain  ${docker_output}  justice_postgres_1
    Should Contain  ${docker_output}  justice_justice-auth_1
    Should Contain  ${docker_output}  justice_justice-ui_1
    Should Contain  ${docker_output}  justice_justice-xmc-messages_1
    Should Contain  ${docker_output}  justice_rabbitmq_1
    Should Contain  ${docker_output}  justice_redis_1
    Should Contain  ${docker_output}  justice_saas-one-func_1

*** Keywords ***
Initialize SSH Connection
    ${login_output}=  Open SSH Connection and Log In  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Should Contain    ${login_output}  Justice Server Appliance
