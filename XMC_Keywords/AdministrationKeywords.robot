*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Administration Page in XMC.

*** Keywords ***

XMC Click Profiles Tab
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_admin_profiles_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_admin_profiles_tab}
    ...       ELSE  Log To Console  Profiles Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Click Users Tab
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_admin_users_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_admin_users_tab}
    ...       ELSE  Log To Console  Users Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Click Options Tab
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_admin_options_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_admin_options_tab}
    ...       ELSE  Log To Console  Options Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Click Diagnostics Tab
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_admin_diagnostics_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_admin_diagnostics_tab}
    ...       ELSE  Log To Console  Diagnostics Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}
