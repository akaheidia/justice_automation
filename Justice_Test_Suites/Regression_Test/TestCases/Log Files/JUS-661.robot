*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-661: syslog error: invalid byte sequence for encoding "UTF8".

*** Variables ***
${syslog}  /var/log/syslog
${error}   invalid byte sequence for encoding "UTF8"

*** Test Cases ***
Confirm Error Not Present
    Log To Console  JUS-661 Not Yet Fixed
#    Confirm File Does Not Contain Value  ${JUS_HOST_IP}  ${JUS_USERNAME}  ${JUS_PASSWORD}  ${syslog}  ${error}
