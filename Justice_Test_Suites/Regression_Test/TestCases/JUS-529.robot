*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-529: Resync: Resync messages continue to come in even after "Resync completed successfully" message is received.

Suite Teardown  Close All Connections

*** Variables ***
${prompt}    $
${jus_ip}    ${JUS_HOST_IP}
${jus_user}  ${JUS_USERNAME}
${jus_pwd}   ${JUS_PASSWORD}
${xmc_ip}    ${XMC_HOST_IP}
${xmc_user}  ${XMC_USERNAME}
${xmc_pwd}   ${XMC_PASSWORD}
${xmc_log}   ${XMC_SERVER_LOG}

*** Test Cases ***
Change XMC Data Pump Diagnostic Level To Verbose
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    XMC Navigate To Administration Page
    XMC Click Diagnostics Tab
    XMC Confirm Diagnostics Tab Loaded
    XMC Expand Diagnostics Tree Node  Server
    XMC Select Diagnostics Tree Node  Server Diagnostics
    Wait Until Page Contains  XMC Data Pump  timeout=5 seconds
    XMC Set XMC Data Pump Diagnostic Level  Verbose
    XMC Diagnostics Click OK
    XMC Log Out and Close Browser

Confirm Resync Messages Not Seen After Resync Complete
    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.
    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}

    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds

    SSH To XMC Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}

    Write  tail -n 50 -f ${xmc_log}
    ${output}=  Read Until  Resync Completed successfully
    Should Contain  ${output}  Resync Completed successfully
    ${output}=  Read
    Should Contain  ${output}  Resync Finished timer canceled
    Should Not Contain  ${output}  RESYNC message sent for type = EVENT

    Close SSH Connection

Reset XMC Data Pump Diagnostic Level
    XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
    XMC Navigate To Administration Page
    XMC Click Diagnostics Tab
    XMC Confirm Diagnostics Tab Loaded
    XMC Expand Diagnostics Tree Node  Server
    XMC Select Diagnostics Tree Node  Server Diagnostics
    Wait Until Page Contains  XMC Data Pump  timeout=5 seconds
    XMC Set XMC Data Pump Diagnostic Level  Default emc.xml Value
    XMC Diagnostics Click OK
    XMC Log Out and Close Browser
