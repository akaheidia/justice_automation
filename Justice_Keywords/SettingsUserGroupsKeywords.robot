*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Settings - User Groups page.

*** Keywords ***

Click User Groups
    Click Element  ${settings_user_groups_menu}

Confirm User Groups Page Loaded
    Page Should Contain Element  ${user_groups_page_title}
