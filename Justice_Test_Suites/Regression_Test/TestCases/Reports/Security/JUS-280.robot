*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-280: Add security to prevent access to LOGI reports without proper authentication.

*** Variables ***
${get_secure_key_url}  ${JUS_URL}/justice/rdTemplate/rdGetSecureKey.aspx?Username=root

*** Test Cases ***
Confirm Reports Cannot Bypass Authentication
    Open and Maximize Browser  ${get_secure_key_url}  ${BROWSER}
    ${key}=  Get Text  xpath://body
    Close Browser

    Open and Maximize Browser  ${JUS_URL}/justice?rdSecureKey=${key}  ${BROWSER}
    Confirm Login Page Loaded
    Close Browser
