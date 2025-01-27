*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${FORM URL}    http://${SERVER}/Form.html
${COMPLETE URL}      http://${SERVER}/Complete.html

*** Keywords ***
Open Browser To Form Page
    Set Selenium Speed    ${DELAY}
    Open Browser    ${FORM URL}    ${BROWSER}    
    Maximize Browser Window
    Form Page Should Be Open

Open Browser To Complete Page
    # Start Chrome For Testing
    Open Browser    ${COMPLETE URL}    ${BROWSER}
    Maximize Browser Window
    Complete Page Should Be Open

Form Page Should Be Open
    Location Should Contain    ${FORM URL}
    Title Should Be    Customer Inquiry

Complete Page Should Be Open
    Location Should Contain    ${COMPLETE URL}
    Title Should Be    Completed

Input Firstname
    [Arguments]    ${firstname}
    Input Text    firstname    ${firstname}
Input Lastname
    [Arguments]    ${lastname}
    Input Text    lastname    ${lastname}
Input Destination
    [Arguments]    ${destination}
    Input Text    destination    ${destination}
Input ContactPerson
    [Arguments]    ${contactperson}
    Input Text    contactperson    ${contactperson}
Input Relationship
    [Arguments]    ${relationship}
    Input Text    relationship    ${relationship}
Input Email
    [Arguments]    ${email}
    Input Text    email    ${email}
Input PhoneNo
    [Arguments]    ${phone}
    Input Text    phone    ${phone}

Submit Customer Form
    Click Button    submitButton
