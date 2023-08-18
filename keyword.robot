*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Login Page
    Open Login Page

Title Should Start With
    Title Should Start With    Login Page

*** Keywords ***
Open Login Page
    Create Webdriver       chrome  https://google.com
    Title Should Be    Login Page

Title Should Start With
    [Arguments]    ${expected}
    ${title} =    Get Title
    Should Start With    ${title}    ${expected}
