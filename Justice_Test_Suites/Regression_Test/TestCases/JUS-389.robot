*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-389: Reports: page will not load - "Error getting a Web request".

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Reports Loads Without Error
    Navigate to Reports
    Confirm Page Does Not Contain Text  There was an error while processing your request
