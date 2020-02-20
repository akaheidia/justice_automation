*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Devices tab on the Monitor List page.

*** Keywords ***

Refresh Devices Table
    Click Element  ${list_refresh_icon}

Download CSV Visible Rows
    Click Element  ${list_download_icon}
    Page Should Contain Element  ${download_csv_visible_rows_menu}
    Click Element  ${download_csv_visible_rows_menu}

Download CSV All Rows
    Click Element  ${list_download_icon}
    Page Should Contain Element  ${download_csv_all_rows_menu}
    Click Element  ${download_csv_all_rows_menu}

Download CSV All Filtered Rows
    Click Element  ${list_download_icon}
    Page Should Contain Element  ${download_csv_all_filtered_rows_menu}
    Click Element  ${download_csv_all_filtered_rows_menu}

Download PDF Visible Rows
    Click Element  ${list_download_icon}
    Page Should Contain Element  ${download_pdf_visible_rows_menu}
    Click Element  ${download_pdf_visible_rows_menu}

Download PDF All Rows
    Click Element  ${list_download_icon}
    Page Should Contain Element  ${download_pdf_all_rows_menu}
    Click Element  ${download_pdf_all_rows_menu}

Download PDF All Filtered Rows
    Click Element  ${list_download_icon}
    Page Should Contain Element  ${download_pdf_all_filtered_rows_menu}
    Click Element  ${download_pdf_all_filtered_rows_menu}


Confirm Device In Table
    [Arguments]  ${device_ip}
    : FOR  ${index}  IN RANGE  1  10
    \    Refresh Devices Table
    \    ${found_device}=  Run Keyword And Return Status  Table Should Contain  ${list_devices_table}  ${device_ip}
    \    Exit For Loop If  ${found_device} == True
    Table Should Contain  ${list_devices_table}  ${device_ip}

Confirm Device Not In Table
    [Arguments]  ${device_ip}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    : FOR  ${index}  IN RANGE  1  10
    \    Refresh Devices Table
    \    ${found_device}=  Run Keyword And Return Status  Table Should Contain  ${list_devices_table}  ${device_ip}
    \    Exit For Loop If  ${found_device} == False
    Element Should Not Contain  ${list_devices_table}  ${device_ip}
    Set Selenium Implicit Wait  ${orig_wait}
