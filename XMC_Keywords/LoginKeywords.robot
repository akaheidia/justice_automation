*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Login page and logging in/out functionality for XMC.

*** Keywords ***
Enter XMC User Name
    [Arguments]  ${USERNAME}
    Input Text  ${xmclogin_username_text}  ${USERNAME}  clear=True

Enter XMC Password
    [Arguments]  ${PASSWORD}
    Input Password  ${xmclogin_password_text}  ${PASSWORD}  clear=True

Click XMC Login
    Element Should Be Enabled  ${xmclogin_login_btn}
    Click Element  ${xmclogin_login_btn}

Clear XMC Credentials
    Clear Element Text  ${xmclogin_username_text}
    Clear Element Text  ${xmclogin_password_text}
    Reload Page

Confirm Successful XMC Login
    Log To Console  Need to implement this
    Wait Until Page Contains Element  ${xmcnav_side_bar}
    Page Should Contain Image  ${xmcnav_logo_image}

Confirm Unauthorized XMC Login
    Wait Until Page Contains Element  ${xmclogin_failed_ok}
    Page Should Contain Element  ${xmclogin_unauthorized_message}

Confirm Successful XMC Logout
    Wait Until Page Contains Element  ${xmclogin_username_text}
    Page Should Contain Image  ${xmclogin_logo_image}
