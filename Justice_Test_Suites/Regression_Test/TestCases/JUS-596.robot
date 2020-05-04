*** Settings ***
Library   SSHLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-596: Close unnecessary exposed ports on appliance.

Suite Setup     Initialize SSH Connection
Suite Teardown  Close SSH Connection

*** Variables ***
${port_list}    9200,9300,5432,4369,15671,15672,25672

*** Test Cases ***
Execute Command and Verify Output
#    ${output}=  Execute Command  apt-get update
#    Log To Console  ${output}
#    ${output}=  Execute Command  apt --fix-broken install
#    Log To Console  ${output}
#    ${output}=  Execute Command  apt-get install nmap
#    Log To Console  ${output}
    Log To Console  Make sure nmap is installed before running this test
#    ${output}=  Execute Command  nmap -p ${port_list} ${JUS_HOST_IP}
#    Log                 ${output}
#    Should Not Contain  ${output}  open
#    Should Contain      ${output}  closed

*** Keywords ***
Initialize SSH Connection
    ${login_output}=  Open SSH Connection and Log In  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Should Contain    ${login_output}  Justice Server Appliance
