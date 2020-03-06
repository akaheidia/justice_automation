*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the End-Systems tab on the Monitor List page.

*** Variables ***
${ENDSYSTEMS_TABLE_STATE_COL}      1
${ENDSYSTEMS_TABLE_VENDOR_COL}     2
${ENDSYSTEMS_TABLE_MAC_COL}        3
${ENDSYSTEMS_TABLE_HOSTNAME_COL}   4
${ENDSYSTEMS_TABLE_USERNAME_COL}   5
${ENDSYSTEMS_TABLE_IP_COL}         6

*** Keywords ***

Refresh End-Systems Table
    Click Element  ${list_refresh_icon}

Get End-System IP Address At Row
    [Arguments]  ${row}
    ${cell_value}=  Get Table Cell  ${endsystems_table}  ${row}  ${ENDSYSTEMS_TABLE_IP_COL}
    [return]  ${cell_value}

Get End-System MAC Address At Row
    [Arguments]  ${row}
    ${cell_value}=  Get Table Cell  ${endsystems_table}  ${row}  ${ENDSYSTEMS_TABLE_MAC_COL}
    [return]  ${cell_value}
