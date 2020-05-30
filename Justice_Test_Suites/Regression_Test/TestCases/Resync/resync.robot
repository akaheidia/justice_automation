*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for all resync issues in non-verbose mode;  includes the following:
...              JUS-203: resync message when justice starts up
...              JUS-318: Handle server disconnects more gracefully
...              JUS-355: Send Analytics Engines (devices) to Justice on startup
...              JUS-460: Messages being discarded on Resync
...              JUS-474: Missing User Group off and on during resync testing with small queue size/dropped actions
...              JUS-492: Resync: Error during resync test: "Action Rate Limit Exceeded[5000]. Queue cleared.
...              JUS-530: Resync: Server missing after resync test
...              JUS-532: Resync: Log is flooded with messages - should be DEBUG level instead of INFO
...              JUS-538: Reports: When XMC disconnects/reconnects, reports lose historical data
...              JUS-562: Resync: Resync does not occur if XMC server is restarted while disconnected.

Suite Setup      Disable Secured Connection So IP Can Be Obtained For RabbitMQ Connections
Suite Teardown   Enable Secured Connection

*** Variables ***
${engine_ip}                 1.1.1.1
${device_ip}                 10.54.142.12
${prompt}                    $
${jus_ip}                    ${JUS_HOST_IP}
${jus_user}                  ${JUS_USERNAME}
${jus_pwd}                   ${JUS_PASSWORD}
${xmc_ip}                    ${XMC_HOST_IP}
${xmc_host}                  ${XMC_HOSTNAME}
${xmc_user}                  ${XMC_USERNAME}
${xmc_pwd}                   ${XMC_PASSWORD}
${xmc_log}                   ${XMC_SERVER_LOG}
${url_for_xmc}               ${XMC_URL}
${url_for_jus}               ${JUS_URL}
${no_connection_msg}         No connection to the remote server.
${resync_start_msg}          Starting Resync...
${resync_end_msg}            Resync Completed successfully.
${queue_exceeded_msg}        queue has exceeded capacity
${actions_dropped_msg}       actions are being dropped
${action_rate_exceeded_msg}  Action Rate limit exceeded
${info_msg}                  INFO [com.extreme.outboundmessage.OutboundMessageEngine] RESYNC message sent for type = EVENT

*** Test Cases ***
Disconnect XMC From Justice Before Creating Devices
# JUS-318
    List RabbitMQ Connections  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    Disconnect From RabbitMQ   ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    List RabbitMQ Connections  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${no_connection_msg}

Create Analytics Engine In XMC
    XMC Open Browser and Log In  ${url_for_xmc}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate To Analytics Page
    XMC Click Analytics Configuration Tab
    XMC Analytics Configuration Close Add Engine Dialog If Displayed
    XMC Analytics Configuration Click Add
    XMC Analytics Configuration Confirm Add Engine Dialog Displayed
    XMC Analytics Configuration Add Engine Set IP Address  ${engine_ip}
    XMC Analytics Configuration Add Engine Set Name        Engine #1
    XMC Analytics Configuration Add Engine Select Profile  snmp_v3_profile
    XMC Analytics Configuration Add Engine Click OK
    XMC Analytics Configuration Confirm Add Engine Dialog Not Displayed

    XMC Navigate to Network Page
    XMC Click Devices Tab
    XMC Click Devices Devices Tab
    XMC Confirm Device In Table  ${engine_ip}
    XMC Log Out and Close Browser

Create Regular Device In XMC
    XMC Open Browser and Log In  ${url_for_xmc}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Click Devices Devices Tab
    XMC Create Device  ${device_ip}  public_v1_Profile  TestDevice
    XMC Log Out and Close Browser

Restart XMC Server After Creating Devices
# JUS-562
    Log To Console  Commented out until JUS-562 is fixed (XMC server restart prevents resync)
#    XMC Restart Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}
#    XMC Wait For Server Restart  ${url_for_xmc}  ${BROWSER}

Connect XMC To Justice After Creating Devices and Confirm Resync Messages
# JUS-203
# JUS-460
# JUS-474
# JUS-492
# JUS-532
    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    List RabbitMQ Connections  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}

    sleep  60 seconds
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${resync_start_msg}
    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${resync_end_msg}
    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${queue_exceeded_msg}
    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${actions_dropped_msg}
    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${action_rate_exceeded_msg}
    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${info_msg}

Confirm Devices Added To Justice
# JUS-355
# JUS-474
# JUS-530
    Open Browser and Log In  ${url_for_jus}  ${BROWSER}  ${jus_user}  ${jus_pwd}
    Click List Slider
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded
    Confirm Filter Panel Contains Server  ${xmc_host}
    Select Servers and Sites Server Tree Node  ${xmc_host}
    Refresh Devices Table
    Search Field Enter Text  ${engine_ip}
    Confirm Device In Table  ${engine_ip}
    Search Field Enter Text  ${device_ip}
    Confirm Device In Table  ${device_ip}
    Log Out and Close Browser

Disconnect XMC From Justice Before Deleting Devices
# JUS-318
    Disconnect From RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    List RabbitMQ Connections  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${no_connection_msg}

Delete Analytics Engine From XMC
    XMC Open Browser and Log In  ${url_for_xmc}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate To Analytics Page
    XMC Click Analytics Configuration Tab
    XMC Analytics Configuration Select Tree Node  Engines
    XMC Analytics Configuration Select Engine In Table  ${engine_ip}
    XMC Analytics Configuration Click Delete
    XMC Analytics Configuration Confirm Delete  ${engine_ip}  true

    XMC Navigate to Network Page
    XMC Click Devices Tab
    XMC Click Devices Devices Tab
    XMC Confirm Device Not In Table  ${engine_ip}
    XMC Log Out and Close Browser

Delete Regular Device From XMC
    XMC Open Browser and Log In  ${url_for_xmc}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded
    XMC Click Devices Devices Tab
    XMC Confirm Device In Table  ${device_ip}
    XMC Delete Device  ${device_ip}
    XMC Refresh Devices Table
    XMC Confirm Device Not In Table  ${device_ip}
    XMC Log Out and Close Browser

Restart XMC Server After Deleting Devices
# JUS-562
    Log To Console  Commented out until JUS-562 is fixed (XMC server restart prevents resync)
#    XMC Restart Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}
#    XMC Wait For Server Restart  ${url_for_xmc}  ${BROWSER}

Connect XMC To Justice After Deleting Devices
# JUS-203
# JUS-460
# JUS-474
# JUS-492
# JUS-532
    Reconnect To RabbitMQ  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    List RabbitMQ Connections  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds
    sleep  60 seconds
    XMC Confirm Server Log Message Output  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${resync_end_msg}
    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${queue_exceeded_msg}
    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${actions_dropped_msg}
    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${action_rate_exceeded_msg}
    XMC Confirm Server Log Does Not Contain Message  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}  ${xmc_log}  ${info_msg}

Confirm Devices Removed From Justice
# JUS-355
# JUS-474
# JUS-530
    Open Browser and Log In  ${url_for_jus}  ${BROWSER}  ${jus_user}  ${jus_pwd}
    Click List Slider
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded
    Confirm Filter Panel Contains Server  ${xmc_host}
    Select Servers and Sites Server Tree Node  ${xmc_host}
    Search Field Enter Text  ${engine_ip}
    Confirm Device Not In Table  ${engine_ip}
    Search Field Enter Text  ${device_ip}
    Confirm Device Not In Table  ${device_ip}
    Log Out and Close Browser

Confirm Report Data Is Present In Justice
# JUS-538
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Navigate to Site Availability Report
    Confirm Site Availability Report Table Contains Value  ${site_device_down}
    Site Availability Drill Into Site  ${site_device_down}
    Log Out and Close Browser

*** Keywords ***
Disable Secured Connection So IP Can Be Obtained For RabbitMQ Connections
    XMC Open Browser and Log In  ${url_for_xmc}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    sleep  1 second
    XMC Select Options Tree Node  Data Pump
    XMC Set Option Value Data Pump Disable Secured Connection
    XMC Set Option Value Data Pump Port  ${option_unsecure_port}
    sleep  1 second
    XMC Options Click Save
    sleep  2 seconds
    XMC Confirm Options Save Warnings Dialog Present
    XMC Options Save Warnings Dialog Click Yes
    XMC Log Out and Close Browser
    Restart XMC Server

Enable Secured Connection
    XMC Open Browser and Log In  ${url_for_xmc}  ${BROWSER}  ${xmc_user}  ${xmc_pwd}
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    sleep  1 second
    XMC Select Options Tree Node  Data Pump
    XMC Set Option Value Data Pump Enable Secured Connection
    XMC Set Option Value Data Pump Port  ${option_secure_port}
    sleep  1 second
    XMC Options Click Save
    sleep  2 seconds
    XMC Confirm Options Save Warnings Dialog Present
    XMC Options Save Warnings Dialog Click Yes
    XMC Log Out and Close Browser
    Restart XMC Server

Restart XMC Server
    XMC Restart Server  ${xmc_ip}  ${xmc_user}  ${xmc_pwd}
    sleep  5 minutes
    XMC Wait For Server Restart  ${url_for_xmc}  ${BROWSER}
