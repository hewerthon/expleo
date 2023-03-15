** Settings **
Resource  ../Steps/Currency_Steps.robot

** Variables **
${result_convertion}            0
${convert}=                     0  
@{converts}=                    50  100  150  200  250
${split_string}                 1 EUR = 

** Keywords **

    

** Test Cases **
Scenario 1: Access site
    [Tags]  regressive
    FOR     ${convert}   IN     @{converts}
        Open Site
        Input Value to Convert  ${convert}
        Select Origem Coin
        Select From Coin
        Click Convert Button
        Calculation Result      ${convert}
        Sleep  5s
    END

Scenario 2: Access site by URL to convert
    [Tags]  url
    FOR  ${convert}  IN  @{converts}
        Open Browser  https://www.xe.com/currencyconverter/convert/?Amount=${convert}&From=EUR&To=GBP  chrome     
        Sleep   3
        Wait Until Element Is Visible       ${Home.euro_value}  10
        Calculation Result                  ${convert}
        Sleep  5s
    END