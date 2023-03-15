*** Settings ***
Resource  ../Resource/Settings.resource
Resource  ../Elements/Main_Elements.resource

*** Keywords ***
Open Site
    Open Browser  https://www.xe.com/currencyconverter/  chrome

Close site
    Close Browser

Calculation Result
    [Arguments]                  ${convert}
    ${elem}                      Get Text  ${Home.euro_value}   
    @{convert_euro}              Split String From Right  ${elem}  ${SPACE}
    ${euro_interger}             Convert To Number  ${convert_euro}[3]
    ${convert}                   Convert To Number  ${convert}
    ${result_convertion}         Run Process    python  -c  print(${euro_interger}*${convert})
    ${euro_interger}             Convert To Number  ${result_convertion.stdout}
    Log to Console               ${euro_interger}
    ${result_convertion}         Run Process    python  -c  print(float("{:.1f}".format(${euro_interger})))
    Should Be Equal As Integers	 ${result_convertion.rc}	 0
    Log to Console               ${result_convertion.stdout}
    @{euro}                      Split String From Right  ${result_convertion.stdout}  .
    Log to Console               ${euro}
    Element Should Contain       (//p[contains(text(), "${euro}[0].")])   ${euro}[0]
    Close Browser

Input Value to Convert
    [Arguments]                  ${convert}
    Input Text                   ${Home.input_amount}     ${convert}

Select Origem Coin
    Input Text                      ${Home.input_from_currency}    EUR
    Wait Until Element Is Visible   ${Home.ul_from_currency_listbox}
    Click Element                   ${Home.ul_from_currency_listbox}

Select From Coin
    Input Text                      ${Home.input_to_currency}     GBP
    Wait Until Element Is Visible   ${Home.ul_to_currency_listbox}
    Click Element                   ${Home.ul_to_currency_listbox}

Click Convert Button
    Wait Until Element Is Visible   ${Home.button_convert}  10
    Click Element                   ${Home.button_convert}
    Sleep   3
    Wait Until Element Is Visible   ${Home.euro_value}  10
