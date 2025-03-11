*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.hsl.fi/en/hsl/open-data
${ticket_and_fares}    xpath://a[@aria-current='false'][normalize-space()='Tickets and fares']
${ticketandfares_page}    xpath://h1[normalize-space()='Tickets and fares']
${single_ticket}    xpath://div[contains(text(),'Single tickets')]
${cookie_popup}    xpath://div[@id='coiConsentBannerBase']
${cookie_accept}    xpath://button[@onclick='CookieInformation.declineAllCategories()']
${singleticket_page}    xpath://div[contains(text(),'Single tickets')]




*** Test Cases ***
Verify Tickets & Fare Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${ticket_and_fares}
    Click Element    ${ticket_and_fares}
    Wait Until Element Is Visible    ${cookie_popup}
    Click Element    ${cookie_accept}
    Wait Until Element Is Visible    ${single_ticket}
    Click Element    ${single_ticket}
    Wait Until Element Is Visible    ${singleticket_page}
    Sleep    5s
    Close Browser