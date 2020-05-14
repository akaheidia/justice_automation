*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-447: Usability - XMC Data Pump options: new fields not at default values at startup.

Suite Setup     XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
Suite Teardown  XMC Log Out and Close Browser

*** Test Cases ***
Confirm Data Pump Options Default Values
    XMC Navigate To Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded
    XMC Select Options Tree Node  Data Pump
    XMC Options Click Restore Defaults

    XMC Confirm Option Value Data Pump Sharing Disabled

    XMC Set Option Value Data Pump Enable Sharing

    XMC Confirm Option Value Data Pump Host  ${option_host}
    XMC Confirm Option Value Data Pump Port  ${option_secure_port}
    XMC Confirm Option Value Data Pump Username  ${option_user}
    XMC Confirm Option Value Data Pump Password  ${option_pwd}

    XMC Confirm Option Value Data Pump Queue Add Delay  ${option_q_delay}
    XMC Confirm Option Value Data Pump Queue Add Service Period  ${option_q_service_period}
    XMC Confirm Option Value Data Pump Max Action Queue Size  ${option_max_action_q_size}
    XMC Confirm Option Value Data Pump Max Actions Queueable  ${option_max_actions_qable}
    XMC Confirm Option Value Data Pump Max Actions Serviced  ${option_max_actions_serviced}
