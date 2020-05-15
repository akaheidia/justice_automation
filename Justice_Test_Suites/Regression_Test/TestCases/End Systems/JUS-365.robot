*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-365: Endpoints: Table is displaying the same row over and over.

Suite Setup      Log In and Navigate to End-Systems Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${xmc_with_endsystems}    ${XMC_2_HOSTNAME}

*** Test Cases ***
Confirm Rows Not Duplicated
    Set Server Filter  ${xmc_with_endsystems}
    sleep  2 seconds
    ${ip_value_1}=  Get End-System IP Address At Row  2
    ${ip_value_2}=  Get End-System IP Address At Row  3
    ${ip_value_3}=  Get End-System IP Address At Row  4

    ${mac_value_1}=  Get End-System MAC Address At Row  2
    ${mac_value_2}=  Get End-System MAC Address At Row  3
    ${mac_value_3}=  Get End-System MAC Address At Row  4

    Run Keyword If  '${ip_value_1}' == '${ip_value_2}' and '${ip_value_1}' == '${ip_value_3}' and '${mac_value_1}' == '${mac_value_2}' and '${mac_value_1}' == '${mac_value_3}'  fail  Duplicate Rows
    ...       ELSE  Log  Rows Not Duplicated
