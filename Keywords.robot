*** Settings ***
Library    SeleniumLibrary
Resource    Selectors.robot
Resource    Variables.robot
*** Keywords ***
Login
    Open Browser    ${URL}    ${Browser}    executable_path=${ChromedriverPath}
    Maximize Browser Window
    Input Text    ${username}    ${USERNAME_data}
    Input Text    ${password}    ${PASSWORD_data}
    Click Button    ${login}
Verify product Page  
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    ${Product_page}

Search product
    [Arguments]    ${Product_type}
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    //div[normalize-space(text())='${Product_type}']
    IF    "${present}" == "True"
        Scroll Element Into View    //div[normalize-space(text())='${Product_type}']
    END
Add to cart
    [Arguments]    ${Product_type}
    ${new_product}=    Evaluate    "${Product_type}".replace(" ", "-").lower()
    Click Element    //button[contains(@id,'${new_product}')]
    Click Element    ${Cart}
Verify Cart
    [Arguments]    ${Product_type}
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    //div[normalize-space(text())='${Product_type}']
    