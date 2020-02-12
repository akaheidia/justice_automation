*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Login page and logging in/out functionality for XMC.

*** Keywords ***
XMC Enter User Name
    [Arguments]  ${USERNAME}
    Input Text  ${xmc_login_username_text}  ${USERNAME}  clear=True

XMC Enter Password
    [Arguments]  ${PASSWORD}
    Input Password  ${xmc_login_password_text}  ${PASSWORD}  clear=True

XMC Click Login
    Element Should Be Enabled  ${xmc_login_login_btn}
    Click Element  ${xmc_login_login_btn}

XMC Clear Credentials
    Clear Element Text  ${xmc_login_username_text}
    Clear Element Text  ${xmc_login_password_text}
    Reload Page

XMC Confirm Successful Login
    Wait Until Page Contains Element  ${xmcnav_side_bar}
    Page Should Contain Image  ${xmcnav_logo_image}

XMC Confirm Unauthorized Login
    Wait Until Page Contains Element  ${xmc_login_failed_ok}
    Page Should Contain Element  ${xmc_login_unauthorized_message}

XMC Confirm Successful Logout
    Wait Until Page Contains Element  ${xmc_login_username_text}
    Page Should Contain Image  ${xmc_login_logo_image}
