*** Settings ***
Library  Collections
Library  RequestsLibrary
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-681: Events: 404 error accessing v1/api/events - Events UI table empty.

Suite Setup    Set Access Token

*** Variables ***
${json_string}
...  {
...    "paginator": {
...      "size": 20,
...      "page": 0
...    }
...  }

*** Test Cases ***
Event API Request Should Have Valid Status Code
    Confirm Post Request Successful  /v1/api/events  ${json_string}
