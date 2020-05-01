*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for all resync issues in verbose mode;  includes the following:
...              JUS-529: Resync: Resync messages continue to come in even after "Resync completed successfully" message is received
...              JUS-532: Resync: Log is flooded with messages - should be DEBUG level instead of INFO

*** Variables ***
${prompt}           $
${jus_ip}           ${JUS_HOST_IP}
${jus_user}         ${JUS_USERNAME}
${jus_pwd}          ${JUS_PASSWORD}
${xmc_ip}           ${XMC_HOST_IP}
${xmc_host}         ${XMC_HOSTNAME}
${xmc_user}         ${XMC_USERNAME}
${xmc_pwd}          ${XMC_PASSWORD}
${xmc_log}          ${XMC_SERVER_LOG}
${url_for_xmc}      ${XMC_URL}
${url_for_jus}      ${JUS_URL}
${resync_end_msg}   Resync Completed successfully.
${timer_canceled}   Resync Finished timer canceled
${resync_msg_sent}  RESYNC message sent for type = EVENT
${debug_msg}        DEBUG [com.extreme.outboundmessage.OutboundMessageEngine] RESYNC message sent for type = EVENT

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
# JUS-529
# JUS-532
    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  30 seconds
    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds

    SSH To XMC Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}

    Write  tail -n 300 -f ${xmc_log}
    ${output}=  Read Until  ${resync_end_msg}
    Should Contain  ${output}  ${resync_end_msg}
    Should Contain  ${output}  ${debug_msg}
    ${output}=  Read
    Should Contain  ${output}  ${timer_canceled}
    Should Not Contain  ${output}  ${resync_msg_sent}

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