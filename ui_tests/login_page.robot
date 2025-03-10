*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.hsl.fi/en/hsl/open-data
${login}          xpath://span[@class='UserMenu_buttonText__kpbQy']


*** Test Cases ***
Verify HSL Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    #${cookies} =    Get Cookies
    Wait Until Element Is Visible    ${login}
    Click Element    ${login}
    Close Browser