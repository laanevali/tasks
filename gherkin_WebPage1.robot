*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
Resource    WebPage1.robot

*** Variables ***
${HOME URL}    https://www.tpilet.ee/
${BROWSER}    Chrome
${TRAVEL ENG URL}    https://www.tpilet.ee/en/travel?departureStop=tallinn&destinationStop=tartu

*** Tasks ***
Search for a trip from Tallinn to Tartu in EN environment
    GIVEN browser is opened to Home Page
    AND accepted cookies
    WHEN user has changed language to English
    AND searched trip from Tallinn Coach Station to Tartu Coach Station
    THEN browser is opened to Trip Page from Tallinn to Tartu

*** Keywords ***
Browser is opened to Home Page
    Open Browser    ${HOME URL}    ${BROWSER}

Accepted cookies
    Click Button    id:web-cookies-accept
User has changed language to English
    Set Browser Implicit Wait    5
    Click Button    id:web-languageselect-en

Searched trip from ${departure} to ${destination}
    Set Browser Implicit Wait    3
    Input Text    id:web-searchform-departureStop    ${departure}
    Click Element    id:web-searchform-departureStop-list
    Input Text    id:web-searchform-destinationStop    ${destination}
    Click Element    id:web-searchform-destinationStop-list
    Click Button    id:web-searchform-search

Browser is opened to Trip Page from Tallinn to Tartu
    Wait Until Element Is Visible    id:trips-panel-scroll-container    8
    Location Should Contain    ${TRAVEL ENG URL}
