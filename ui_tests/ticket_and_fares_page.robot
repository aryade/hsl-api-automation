*** Settings ***
Library           SeleniumLibrary
Resource        hsl_keywords.robot




*** Test Cases ***
Verify Single Tickets & Fare Page
    Open HSL Page In The Browser
    Open Tickets And Fares Page
    Manage Cookies
    Open Single Ticket Page
    [Teardown]    Close Browser