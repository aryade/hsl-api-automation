*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.hsl.fi/en/hsl/open-data
${login}          xpath://span[@class='UserMenu_buttonText__kpbQy']
${login_page}    xpath://h2[normalize-space()='Log in']
${username_filed}        xpath://input[@id='gwt-uid-5']
${password_field}        xpath://input[@id='gwt-uid-9']
${login_button}        xpath:(//div[@class='v-button v-widget primary v-button-primary button-main v-button-button-main login-button v-button-login-button v-pressed'])[1]
${ticket_and_fares}    xpath://a[@aria-current='false'][normalize-space()='Tickets and fares']
${ticketandfares_page}    xpath://h1[normalize-space()='Tickets and fares']
${single_ticket}    xpath://div[contains(text(),'Single tickets')]
${cookie_popup}    xpath://div[@id='coiConsentBannerBase']
${cookie_accept}    xpath://button[@onclick='CookieInformation.declineAllCategories()']
${singleticket_page}    xpath://div[contains(text(),'Single tickets')]

*** Keywords ***
Open HSL Page In The Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Open Browser To Login Page
    Wait Until Element Is Visible    ${login}
    Click Element    ${login}
    Wait Until Element Is Visible    ${login_page}

Input Username
    [Arguments]    ${username}
    Input Text    ${username_filed}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${password_field}    ${password}

Submit Credentials
    Click Button    ${login_button}

Open Tickets And Fares Page
    Wait Until Element Is Visible    ${ticket_and_fares}
    Click Element    ${ticket_and_fares}

Manage Cookies
    Wait Until Element Is Visible    ${cookie_popup}
    Click Element    ${cookie_accept}

Open Single Ticket Page
    Wait Until Element Is Visible    ${single_ticket}
    Click Element    ${single_ticket}
    Wait Until Element Is Visible    ${singleticket_page}
    Sleep    5s