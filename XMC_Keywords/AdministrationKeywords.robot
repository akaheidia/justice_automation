*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Administration Page in XMC.

*** Keywords ***

XMC Click Profiles Tab
    Click Element  ${xmc_admin_profiles_tab}

XMC Click Users Tab
    Click Element  ${xmc_admin_users_tab}

XMC Click Options Tab
    Click Element  ${xmc_admin_options_tab}

XMC Click Diagnostics Tab
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_admin_diagnostics_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_admin_diagnostics_tab}
    ...       ELSE  Log To Console  Diagnostics Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}
