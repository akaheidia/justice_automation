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
