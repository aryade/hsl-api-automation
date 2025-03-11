*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.hsl.fi/en/hsl/open-data
${ticket_and_fares}    xpath://a[@aria-current='false'][normalize-space()='Tickets and fares']
${ticketandfares_page}    xpath://h1[normalize-space()='Tickets and fares']
${single_ticket}    xpath://div[contains(text(),'Single tickets')]


*** Test Cases ***
Verify HSL Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    #${cookies} =    Get Cookies
    Wait Until Element Is Visible    ${ticket_and_fares}
    Click Element    ${ticket_and_fares}
    ${cookies} =    Get Cookies
    Wait Until Element Is Visible    ${single_ticket}
    Click Element    ${single_ticket}
    Close Browser