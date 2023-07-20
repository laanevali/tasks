*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME URL}    https://www.tpilet.ee/
${BROWSER}    Chrome
${HOME ENG URL}   https://www.tpilet.ee/en/ 
${TRAVEL ENG URL}    https://www.tpilet.ee/en/travel?departureStop=tallinn&destinationStop=tartu

*** Tasks ***
Seach for a trip from Tallinn to Tartu in EN environment
    Open Browser To Home Page
    Accept Cookies
    Change Language To English
    English Home Page Should Be Open
    Input Departure    tallinn coach station
    Input Destination    tartu coach station
    Submit Trip
    Wait For Trips Panel
    Travel Page Should Be Open
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${HOME URL}    ${BROWSER}

Accept Cookies
    Click Button    id:web-cookies-accept

Change Language To English
    Set Browser Implicit Wait    3
    Click Button    id:web-languageselect-en

English Home Page Should Be Open
    Location Should Be    ${HOME ENG URL}

Input Departure
    [Arguments]   ${departure} 
    Set Browser Implicit Wait    3
    Input Text    id:web-searchform-departureStop    ${departure}

Input Destination
    [Arguments]    ${destination}
    Input Text    id:web-searchform-destinationStop    ${destination}

Submit Trip
    Click Button    id:web-searchform-search

Wait For Trips Panel
    Wait Until Element Is Visible    id:trips-panel-scroll-container

Travel Page Should Be Open
    Location Should Contain    ${TRAVEL ENG URL}