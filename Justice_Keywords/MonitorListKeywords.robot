*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Monitor List page.

*** Keywords ***

Log In and Navigate to Devices Tab
    [Arguments]  ${url}  ${browser}  ${user}  ${pwd}
    Open Browser and Log In  ${url}  ${browser}  ${user}  ${pwd}
    Click Monitor
    Click List Slider
    Click Devices Tab
    Confirm Devices Tab Selected

Log In and Navigate to End-Systems Tab
    [Arguments]  ${url}  ${browser}  ${user}  ${pwd}
    Open Browser and Log In  ${url}  ${browser}  ${user}  ${pwd}
    Click Monitor
    Click List Slider
    Click End-Systems Tab
    Confirm End-Systems Tab Selected

Log In and Navigate to Alarms Tab
    [Arguments]  ${url}  ${browser}  ${user}  ${pwd}
    Open Browser and Log In  ${url}  ${browser}  ${user}  ${pwd}
    Click Monitor
    Click List Slider
    Click Alarms Tab
    Confirm Alarms Tab Selected

Log In and Navigate to Events Tab
    [Arguments]  ${url}  ${browser}  ${user}  ${pwd}
    Open Browser and Log In  ${url}  ${browser}  ${user}  ${pwd}
    Click Monitor
    Click List Slider
    Click Events Tab
    Confirm Events Tab Selected


Click Devices Tab
    Click Element  ${list_devices_tab}

Click End-Systems Tab
    Click Element  ${list_endsystems_tab}

Click Alarms Tab
    Click Element  ${list_alarms_tab}

Click Events Tab
    Click Element  ${list_events_tab}


Go To Last Page
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${enabled}=  Run Keyword And Return Status  Element Should Be Visible  ${list_last_page_icon}${enabled_xpath_value}
    Run Keyword If  '${enabled}'=='True'  Click Element  ${list_last_page_icon}
    ...    ELSE    Log  Last Page Icon Is Disabled
    Set Selenium Implicit Wait  ${orig_wait}

Go To First Page
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${enabled}=  Run Keyword And Return Status  Element Should Be Visible  ${list_first_page_icon}${enabled_xpath_value}
    Run Keyword If  '${enabled}'=='True'  Click Element  ${list_first_page_icon}
    ...    ELSE    Log  First Page Icon Is Disabled
    Set Selenium Implicit Wait  ${orig_wait}

Go To Next Page
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${enabled}=  Run Keyword And Return Status  Element Should Be Visible  ${list_next_page_icon}${enabled_xpath_value}
    Run Keyword If  '${enabled}'=='True'  Click Element  ${list_next_page_icon}
    ...    ELSE    Log  Next Page Icon Is Disabled
    Set Selenium Implicit Wait  ${orig_wait}

Go To Previous Page
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${enabled}=  Run Keyword And Return Status  Element Should Be Visible  ${list_prev_page_icon}${enabled_xpath_value}
    Run Keyword If  '${enabled}'=='True'  Click Element  ${list_prev_page_icon}
    ...    ELSE    Log  Previous Page Icon Is Disabled
    Set Selenium Implicit Wait  ${orig_wait}


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

Open Add Sort Menu
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${menu_closed}=  Run Keyword And Return Status  Element Should Not Be Visible  ${sort_add_menu_panel}
    Run Keyword If  '${menu_closed}'=='True'  Click Element  ${sort_add_icon}
    Set Selenium Implicit Wait  ${orig_wait}

Close Add Sort Menu
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${menu_open}=  Run Keyword And Return Status  Element Should Be Visible  ${sort_add_menu_panel}
    Run Keyword If  '${menu_open}'=='True'  Click Element  ${sort_add_icon_open}
    Set Selenium Implicit Wait  ${orig_wait}

Select Sort Choice
    [Arguments]  ${sort}
    Element Should Be Visible  ${sort_add_menu_panel}
    Click Element  xpath://span[contains(text(), '${sort}')]

Click Remove Sort Icon
    [Arguments]  ${sort}
    Click Element  xpath://span[text()='${sort}']/..${sort_remove_icon_xpath_value}

Add Sort
    [Arguments]  ${sort}
    Open Sort Menu
    Open Add Sort Menu
    Select Sort Choice  ${sort}
    Close Add Sort Menu
    Close Sort Menu

Remove Sort
    [Arguments]  ${sort}
    Open Sort Menu
    Click Remove Sort Icon  ${sort}
    Close Sort Menu

Set Sort Direction
    [Arguments]  ${sort}  ${direction}
    Open Sort Menu
    Run Keyword If  '${direction}'=='Ascending'  Click Element  xpath://span[text()='${sort}']/..${sort_ascending_menu_xpath_value}
    ...    ELSE IF  '${direction}' == 'Descending'  Click Element  xpath://span[text()='${sort}']/..${sort_descending_menu_xpath_value}
    ...    ELSE     Fail  Invalid Sort Direction: ${direction}
    Close Sort Menu


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

Confirm Sort Menu Closed
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Element Should Not Be Visible  ${list_sort_selected_icon}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Sort Applied
    Element Should Be Visible  ${sort_applied_indicator}

Confirm Sort Not Applied
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Element Should Not Be Visible  ${sort_applied_indicator}
    Set Selenium Implicit Wait  ${orig_wait}
