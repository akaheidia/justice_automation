*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the End Points tab on the Monitor List page.

*** Variables ***
${ENDPOINT_TABLE_STATE_COL}      1
${ENDPOINT_TABLE_VENDOR_COL}     2
${ENDPOINT_TABLE_MAC_COL}        3
${ENDPOINT_TABLE_HOSTNAME_COL}   4
${ENDPOINT_TABLE_USERNAME_COL}   5
${ENDPOINT_TABLE_IP_COL}         6

*** Keywords ***

Refresh End Points Table
    Click Element  ${list_refresh_icon}

Get End Point IP Address At Row
    [Arguments]  ${row}
    ${cell_value}=  Get Table Cell  ${endpoints_table}  ${row}  ${ENDPOINT_TABLE_IP_COL}
    [return]  ${cell_value}

Get End Point MAC Address At Row
    [Arguments]  ${row}
    ${cell_value}=  Get Table Cell  ${endpoints_table}  ${row}  ${ENDPOINT_TABLE_MAC_COL}
    [return]  ${cell_value}
