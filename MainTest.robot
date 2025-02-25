*** Settings ***
Library    SeleniumLibrary
Resource    Variables.robot
Resource    Selectors.robot
Resource    Keywords.robot

*** Test Cases ***
Login And Search Product
    Login
    Verify product Page
    Search product    ${PRODUCT}   
    Add to cart    ${PRODUCT}    
    Verify cart    ${PRODUCT}
    Close Browser

