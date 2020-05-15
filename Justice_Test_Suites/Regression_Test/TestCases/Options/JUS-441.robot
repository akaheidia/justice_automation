*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-441: Usability - XMC Data Pump options: RabbitMQ URI field needs to aid user in field contents.

Suite Setup      XMC Open Browser and Log In  ${XMC_2_URL}  ${BROWSER}  ${XMC_2_USERNAME}  ${XMC_2_PASSWORD}
Suite Teardown   XMC Log Out and Close Browser

*** Test Cases ***
Confirm Data Pump Options for RabbitMQ URI are Split Into Components
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded

    XMC Select Options Tree Node  Data Pump
    XMC Set Option Value Data Pump Enable Sharing

    XMC Set Option Value Data Pump Host  ${JUS_HOST_IP}
    XMC Set Option Value Data Pump Port  ${option_secure_port}
    XMC Set Option Value Data Pump Username  ${option_user}
    XMC Set Option Value Data Pump Password  ${option_pwd}

    XMC Confirm Option Value Data Pump Host  ${JUS_HOST_IP}
    XMC Confirm Option Value Data Pump Port  ${option_secure_port}
    XMC Confirm Option Value Data Pump Username  ${option_user}
    XMC Confirm Option Value Data Pump Password  ${option_pwd}
