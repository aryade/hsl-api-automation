*** Settings ***
Library           SeleniumLibrary
Resource        hsl_keywords.robot




*** Test Cases ***
Verify Single Tickets & Fare Page
    Open HSL Page In The Browser
    Open Tickets And Fares Page
    Manage Cookies
    Open Single Ticket Page
    Verify the Customer Group in the DropDown
    Select Child From the Customer Group
    [Teardown]    Close Browser