*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-532: Resync: Log is flooded with messages - should be DEBUG level instead of INFO.

Suite Teardown  Close All Connections

*** Variables ***
${prompt}         $
${jus_ip}         ${JUS_HOST_IP}
${jus_user}       ${JUS_USERNAME}
${jus_pwd}        ${JUS_PASSWORD}
${xmc_ip}         ${XMC_HOST_IP}
${xmc_user}       ${XMC_USERNAME}
${xmc_pwd}        ${XMC_PASSWORD}
${xmc_log}        ${XMC_SERVER_LOG}
${info_msg}       INFO [com.extreme.outboundmessage.OutboundMessageEngine] RESYNC message sent for type = EVENT
${debug_msg}      DEBUG [com.extreme.outboundmessage.OutboundMessageEngine] RESYNC message sent for type = EVENT

*** Test Cases ***
Confirm Extraneous Resync Messages Not Seen
    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  30 seconds
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.
    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds
    XMC Confirm Server Log Contains Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Resync Completed successfully
    sleep  10 seconds
    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${info_msg}

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

Confirm Verbose Resync Messages Seen
    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  30 seconds
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  No connection to the remote server.
    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}

    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds
    XMC Confirm Server Log Contains Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  Resync Completed successfully
    sleep  10 seconds
    XMC Confirm Server Log Contains Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${debug_msg}

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
