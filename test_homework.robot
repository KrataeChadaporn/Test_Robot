*** Settings ***
Library    OperatingSystem
Library    Collections
Library    String
Library    CSVLibrary
Library    SeleniumLibrary
Library    XML
Variables    /Users/kratae/Documents/QA/test_robot/data.yaml

# Resource    open_web.robot

*** Test Cases ***
Get Csv testing
    ${CSV_FILE}    Set Variable    /Users/kratae/Documents/QA/test_robot/test_robot_csv.csv
    ${DATA_CSV}    Read Csv File To Associative    ${CSV_FILE}
    # Log To Console    ${DATA_CSV}
     FOR    ${row}    IN    @{DATA_CSV}
     Open Browser chrome   ${url}    ${browser}
     Input Username    ${row}[\ufeffUsername]
     Input Password    ${row}[Password]
     Click login
     Verify Text Products
     Click Add
     Verify Cart
     Click Cart
     Verify Text Cart
     Verify Text Your Products
     Verify Text Products Price
     Click Checkout
     Verify Text Checkout
     Input Fname    ${row}[Firstname]
     Input Lname    ${row}[Lastname]
     Input Code    ${row}[Code]
     Click Continue
     Verify Text Overview
     Verify Text Your Products
    #  Verify Text Products Price
    Click Finish
    Verify Text Thankyou
    Click Ham
    Verify Element Logout
    Click Logout
    Verify Text Login

        #  Log To Console   ${row}[\ufeffUsername]
        #  Log To Console    ${row}[Password]
     END

*** Keywords ***
Open Browser chrome
    [Arguments]    ${url}    ${browser}
    Open Browser   ${url}    ${browser}
Input Username
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username} 

Input Password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]    ${password}    

Click login
    Click Element    //*[@id="login-button"]

Verify Text Products
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=30s

Click add
    Click Button    //*[@id="inventory_container"]/div/div[1]/div[3]/button


Verify Cart
    Wait Until Element Is Visible    //*[@id="shopping_cart_container"]/a    timeout=30s
Click Cart
    Click Element    //*[@id="shopping_cart_container"]/a

Verify Text Cart
    Wait Until Element Is Visible    //div[contains(text(),"Your Cart")]    timeout=30s

Verify Text Your Products
    Wait Until Element Is Visible    //div[contains(text(),"Sauce Labs Backpack")]    timeout=30s

Verify Text Products Price
    Wait Until Element Is Visible    //div[contains(text(),"29.99")]    timeout=30s

Click Checkout
    Click Element    //*[@id="cart_contents_container"]/div/div[2]/a[2]


Verify Text Checkout
    Wait Until Element Is Visible    //div[contains(text(),"Checkout: Your Information")]    timeout=30s

Input Fname
    [Arguments]   ${Firstname}
    Input Text    //*[@id="first-name"]    ${Firstname}

Input Lname
    [Arguments]   ${Lastname}
    Input Text    //*[@id="last-name"]    ${Lastname}

Input Code
    [Arguments]   ${Code}
    Input Text    //*[@id="postal-code"]    ${Code}

Click Continue
    Click Element    //*[@id="checkout_info_container"]/div/form/div[2]/input

Verify Text Overview
    Wait Until Element Is Visible    //div[contains(text(),"Checkout: Overview")]    timeout=30s


Click Finish
    Click Element    //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

Verify Text Thankyou
    Wait Until Element Is Visible    //div[contains(text(),"Finish")]    timeout=30s

Click Ham
    Click Button    //*[@id="menu_button_container"]/div/div[3]/div/button

Verify Element Logout
    Wait Until Element Is Visible    //*[@id="logout_sidebar_link"]    timeout=30s

Click Logout
    Click Element     //*[@id="logout_sidebar_link"]

Verify Text Login
    Wait Until Element Is Visible    //*[@id="login-button"]    timeout=30s


