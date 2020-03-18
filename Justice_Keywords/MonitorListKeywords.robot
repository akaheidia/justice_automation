*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Monitor List page.

*** Keywords ***

Click Devices Tab
    Click Element  ${list_devices_tab}

Click End-Systems Tab
    Click Element  ${list_endsystems_tab}

Click Alarms Tab
    Click Element  ${list_alarms_tab}

Click Events Tab
    Click Element  ${list_events_tab}


Download CSV Visible Rows
    Open Download Menu
    Element Should Be Visible  ${download_csv_visible_rows_menu}
    Click Element  ${download_csv_visible_rows_menu}

Download CSV All Rows
    Open Download Menu
    Element Should Be Visible  ${download_csv_all_rows_menu}
    Click Element  ${download_csv_all_rows_menu}

Download CSV All Filtered Rows
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Open Download Menu
    ${menu_present}=  Run Keyword And Return Status  Element Should Be Visible  ${download_csv_all_filtered_rows_menu}
    Run Keyword If  '${menu_present}'=='True'  Click Element  ${download_csv_all_filtered_rows_menu}
    ...    ELSE    Close Download Menu
    Set Selenium Implicit Wait  ${orig_wait}

Download PDF Visible Rows
    Open Download Menu
    Element Should Be Visible  ${download_pdf_visible_rows_menu}
    Click Element  ${download_pdf_visible_rows_menu}

Download PDF All Rows
    Open Download Menu
    Element Should Be Visible  ${download_pdf_all_rows_menu}
    Click Element  ${download_pdf_all_rows_menu}

Download PDF All Filtered Rows
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Open Download Menu
    ${menu_present}=  Run Keyword And Return Status  Element Should Be Visible  ${download_pdf_all_filtered_rows_menu}
    Run Keyword If  '${menu_present}'=='True'  Click Element  ${download_pdf_all_filtered_rows_menu}
    ...    ELSE    Close Download Menu
    Set Selenium Implicit Wait  ${orig_wait}

Open Download Menu
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${menu_closed}=  Run Keyword And Return Status  Element Should Be Visible  ${list_download_icon}
    Run Keyword If  '${menu_closed}'=='True'  Click Element  ${list_download_icon}
    Set Selenium Implicit Wait  ${orig_wait}

Close Download Menu
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${menu_open}=  Run Keyword And Return Status  Element Should Be Visible  ${list_download_selected_icon}
    Run Keyword If  '${menu_open}'=='True'  Click Element  ${list_download_selected_icon}
    Set Selenium Implicit Wait  ${orig_wait}


Open Sort Menu
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${menu_closed}=  Run Keyword And Return Status  Element Should Not Be Visible  ${sort_menu_panel}
    Run Keyword If  '${menu_closed}'=='True'  Click Element  ${list_sort_icon}
    Set Selenium Implicit Wait  ${orig_wait}

Close Sort Menu
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${menu_open}=  Run Keyword And Return Status  Element Should Be Visible  ${sort_menu_panel}
    Run Keyword If  '${menu_open}'=='True'  Click Element  ${list_sort_selected_icon}
    Set Selenium Implicit Wait  ${orig_wait}


Confirm List Page Loaded
    Page Should Contain Element  ${monitor_page_title}
    Page Should Contain Element  ${monitor_map_slider}
    Page Should Contain Element  ${monitor_list_slider}
    Confirm List Slider Selected

Confirm Devices Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${list_devices_page_url_suffix}

Confirm End-Systems Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${list_endsystems_page_url_suffix}

Confirm Alarms Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${list_alarms_page_url_suffix}

Confirm Events Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${list_events_page_url_suffix}

Confirm Download Menu Closed
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Element Should Not Be Visible  ${list_download_selected_icon}
    Set Selenium Implicit Wait  ${orig_wait}
