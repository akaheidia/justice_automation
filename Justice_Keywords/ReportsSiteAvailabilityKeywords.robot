*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Site Availability Report page.

*** Variables ***
${TABLE_SERVER_SITE_COL}      1


*** Keywords ***

Confirm Site Availability Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  ${reports_site_availability_page_title}

    Unselect Frame
    Unselect Frame

Confirm Site Availability Report Contains Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  xpath://span[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame

Confirm Site Availability Report Table Header Contains Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  xpath://a[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame

Confirm Site Availability Report Table Contains Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  xpath://td[*]/span[contains(text(),'${value}')]

    Unselect Frame
    Unselect Frame

Confirm Site Availability Report Table Does Not Contain Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Not Contain Element  xpath://td[*]/span[contains(text(),'${value}')]

    Unselect Frame
    Unselect Frame

Get Site Availability Report Table Value Count
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    ${count}=  Get Element Count  xpath://td[*]/span[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame

    [return]  ${count}


Site Availability Drill Into Site
    [Arguments]  ${site}
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='availability']
    Select Frame  xpath://iframe[@id='availability']

    sleep  1 second
    # Determine the "ends-with" value by taking the length of the entire string, subtracting the length of the string being looked for,
    # and seeing if the resulting substring at the end of the entire string matches the string we are looking for.
    # This can be changed to "ends-with" xpath 2.0 string function when browsers support xpath 2.0.
    Wait Until Page Contains Element  xpath://span[(substring(text(), string-length(text()) - string-length('${site}') +1) = '${site}') and not(@class='hidden')]
    Click Element  xpath://span[(substring(text(), string-length(text()) - string-length('${site}') +1) = '${site}') and not(@class='hidden')]

    Unselect Frame
    Unselect Frame


Get Site Availability Server Site Value At Row
    [Arguments]  ${row}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    ${cell_value}=  Get Table Cell  ${site_availability_table}  ${row}  ${TABLE_SERVER_SITE_COL}

    Unselect Frame
    Unselect Frame

    [return]  ${cell_value}
