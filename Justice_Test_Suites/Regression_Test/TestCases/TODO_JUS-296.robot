#*** Settings ***
#Library   SeleniumLibrary
#Library   DatabaseLibrary
#Resource  ../Resources/AllResources.robot
#
#Documentation    Regression test for JUS-296: End-Systems do not make it into the postgres database.
#
#*** Test Cases ***
#Execute Command and Verify Output
#    Initialize SSH Connection
#    ${docker_output}=  Execute Command  docker ps
#    Log             ${docker_output}
#    Should Contain  ${docker_output}  justice_postgres_1
#
#    Write  docker exec -it justice_postgres_1 /bin/bash
#    ${output_1}=  Read
#    Log To Console  OUTPUT 1:  ${output_1}
#
#    Write  psql -U postgres
#    ${output_2}=  Read
#    Log To Console  OUTPUT 2:  ${output_2}
#
##    Write  select COUNT(ipaddress) from netsightrpt.cachedendsystem;
##    ${postgres_output}=  Read Until  cachedendsystem;
##    Log To Console  POSTGRES OUTPUT:  ${postgres_output}
##    ${next_output}=  Read
##    Log To Console  FINAL OUTPUT ${next_output}
#
##    ${rows}=  Row Count  select ipaddress from netsightrpt.cachedendsystem;
##    Log To Console  ROW COUNT: ${rows}
#
#    Close SSH Connection
#
##Confirm Rows Present
##    Log In and Navigate to End-Systems Tab
##    ${ip_value_1}=  Get End-System IP Address At Row  2
##    Log Out and Close Browser
#
#
#*** Keywords ***
#Log In and Navigate to End-Systems Tab
#    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
#    Click Monitor
#    Click List Slider
#    Click End-Systems Tab
#    Confirm End-Systems Tab Selected
#    Set Server Filter  ${XMC_HOSTNAME}
#
#Initialize SSH Connection
#    ${login_output}=  Open SSH Connection and Log In  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}
#    Should Contain    ${login_output}  Justice Server Appliance
