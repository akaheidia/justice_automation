*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Login page and logging in/out functionality.

*** Keywords ***
Enter User Name
    [Arguments]  ${username}
    Input Text  ${login_username_text}  ${username}  clear=True

Enter Password
    [Arguments]  ${pwd}
    Input Password  ${login_password_text}  ${pwd}  clear=True

Click Login
    Element Should Be Enabled  ${login_login_btn}
    Click Element  ${login_login_btn}

Close Message Box
    Page Should Contain Element  ${login_failed_ok}
    Click Element  ${login_failed_ok}

Clear Credentials
    Clear Element Text  ${login_username_text}
    Clear Element Text  ${login_password_text}
    Reload Page

Confirm Successful Login
    Wait Until Page Contains Element  ${nav_side_bar}
    ${page_url}=  Get Location
    Location Should Contain  ${home_page_url_suffix}
    Page Should Contain Image  ${nav_logo_image}

Confirm Unauthorized Login
    Wait Until Page Contains Element  ${login_failed_ok}
    Page Should Contain Element  ${login_unauthorized_message}

Confirm Missing Credentials
    Element Should Be Disabled  ${login_login_btn}

Confirm Successful Logout
    Wait Until Page Contains Element  ${login_username_text}
    ${page_url}=  Get Location
    Confirm Login Page Loaded

Confirm Login Page Loaded
    Location Should Contain  ${login_page_url_suffix}
    Page Should Contain Image  ${login_logo_image}
