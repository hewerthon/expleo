*** Variables ***

&{Home}
...  input_amount=id:amount
...  input_amount=id:amount
...  input_from_currency=id:midmarketFromCurrency
...  ul_from_currency_listbox=//li[@id='midmarketFromCurrency-option-0']
...  input_to_currency=id:midmarketToCurrency
...  ul_to_currency_listbox=//li[@id='midmarketToCurrency-option-0']
...  button_convert=(//button[contains(text(), "Convert")])[3]
...  euro_value=(//p[contains(text(), "1 EUR = ")])[2]
...  pound_value=(//p[contains(text(), "1 GBP = ")])[1]