*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.allonline.7eleven.co.th/
${Email}    xxx
${Password}    xxx
${Name}    xxx
${ProductName}    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N
${ProductPrice}    ฿ 399
${ProductPoint}    คุณจะได้รับ 117 คะแนน
${ProductUnit}    1
${OrderCount}    1 ชิ้น
${Firstname}    กาญจนา
${Lastname}    มงคล
${Mobile}    0903958789
${AddrNo}    56/89
${Soi}    สามเสน
${DeliveryPrice}    ฿ 35
${SumPrice}    ฿ 434
${Point}    117

*** Test Cases ***
ทดสอบซื้อสินค้าและชำระเงินด้วย QR payment สำเร็จ
    เข้าสู่ระบบ All Online ด้วย Email และ Login สำเร็จ
    ค้นหาสินค้าด้วย คำค้นหา
    ตรวจสอบผลการค้นหา
    เลือกดูสินค้า
    ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของ
    เพิ่มสินค้าลงตะกร้า
    ตรวจสอบจำนวนของสินค้า และราคาสินค้าในตะกร้า
    กดปุ่มดำเนินการชำระเงิน เลือกจัดส่งตามที่อยู่ และใส่ที่อยู่จัดส่งสินค้า
    เลือกช่องทางการชำระเงินแบบ QR Payment
    ตรวจสอบราคาสินค้า ค่าจัดส่ง ราคารวมที่ต้องชำระเงิน และ All member Point ที่ต้องได้รับ
    ดำเนินการสั่งซื้อ
    ตรวจสอบคำสั่งซื้อ

*** Keywords ***
เข้าสู่ระบบ All Online ด้วย Email และ Login สำเร็จ
    Open Browser    url=${URL}    browser=chrome    
    Maximize Browser Window
    Wait Until Element Is Visible    //*[@id="page"]/header/div[4]/div/div/div/ul/li[4]/a
    Click Element    //*[@id="page"]/header/div[4]/div/div/div/ul/li[4]/a
    Wait Until Element Is Visible    name:email
    Input Text    name:email    ${Email}
    Input Text    name:password    ${Password}
    Click Element    //*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]
    Wait Until Element Is Visible    //*[@id="login-dropdown"]/span[1]
    Element Should Contain    //*[@id="login-dropdown"]/span[1]    ${Name}

ค้นหาสินค้าด้วย คำค้นหา
    Input Text    name:q    ${ProductName}
    Click Element    //*[@id="search_id_form"]/div/span/button

ตรวจสอบผลการค้นหา
    Wait Until Element Is Visible    //*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div
    Element Should Contain    //*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]/div/a[2]/div    ${ProductName}
    Element Should Contain    //*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]/div/div[6]/div[2]/span/strong    ${ProductPrice}

เลือกดูสินค้า
    Click Element    //*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]/div/a[1]
    
ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของ
    Wait Until Element Is Visible    //*[@id="article-form"]/div[1]/div[2]/div/div[2]/div/span/span
    Element Should Contain    //*[@id="article-form"]/div[1]/div[2]/div/div[2]/div/span/span    ${ProductPoint}

เพิ่มสินค้าลงตะกร้า
    Click Button    //*[@id="article-form"]/div[2]/div[2]/div[4]/div[1]/button
    Wait Until Element Is Visible    //*[@id="mini-basket"]/a/span[1]
    Element Should Contain    //*[@id="mini-basket"]/a/span[1]    ${ProductUnit}

ตรวจสอบจำนวนของสินค้า และราคาสินค้าในตะกร้า
    Click Element    //*[@id="mini-basket"]/a
    Wait Until Element Is Visible    //*[@id="page"]/div[2]/div[2]/div[2]/div/div[1]/div/h1
    Element Should Contain    //*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[2]/a    ${ProductName}
    Element Should Contain    //*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[9]/div/div[2]/span[2]    ${OrderCount}
    Element Should Contain    //*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[9]/div/div[2]/span[1]    ${ProductPrice}

กดปุ่มดำเนินการชำระเงิน เลือกจัดส่งตามที่อยู่ และใส่ที่อยู่จัดส่งสินค้า
    Click Element    //*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[10]/div/div/div/a
    Wait Until Element Is Visible    //*[@id="address-tabs"]/ul/li[2]/a
    Click Element    //*[@id="address-tabs"]/ul/li[2]/a
    Wait Until Element Is Visible    //*[@id="address"]/div[1]/div[2]
    Wait Until Element Is Visible    //*[@id="address"]/div[1]/div[2]/div
    Click Element    //*[@id="address"]/div[1]/div[2]/div
    Input Text    id:new-address-name    ${Firstname}        
    Input Text    id:new-address-lastname    ${Lastname}
    Input Text    id:new-address-mobile    ${Mobile}
    Input Text    id:new-address-addrno    ${AddrNo}
    Input Text    id:new-address-soi    ${Soi}
    Input Text    id:new-address-soi    ${AddrNo}
    Select From List By Label    id:new-address-province    กรุงเทพมหานคร
    Select From List By Label    id:new-address-district    ดุสิต
    Select From List By Label    id:new-address-sub-district    ดุสิต
    Wait Until Element Is Visible    id:map-location
    Click Element    id:selected-location
    Element Attribute Value Should Be    id:new-address-postal-code    value     10300
    Execute JavaScript    document.getElementById('continue-payment-btn').click();

เลือกช่องทางการชำระเงินแบบ QR Payment
    Wait Until Element Is Visible    //*[@id="page"]/div/div[2]/div/div
    Click Element    //*[@id="payment-options"]/div[4]

ตรวจสอบราคาสินค้า ค่าจัดส่ง ราคารวมที่ต้องชำระเงิน และ All member Point ที่ต้องได้รับ
    Element Should Contain    //*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[2]    ${ProductName}
    Element Should Contain    //*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[3]    ${ProductUnit}
    Element Should Contain    //*[@id="js-invoice-details-tbody"]/tr[1]/td[2]/b    ${ProductPrice}
    Element Should Contain    //*[@id="js-invoice-details-tbody"]/tr[2]/td[2]/b    ${DeliveryPrice}
    Element Should Contain    id:totalAmount    ${SumPrice}
    Element Should Contain    //*[@id="js-invoice-details-tbody"]/tr[17]/td[2]/b    ${Point}

ดำเนินการสั่งซื้อ
    Run Keyword And Ignore Error    Click Element    //div[contains(@class, 'alert-cookie-gdpr-allonline')]//button[contains(@class, 'close')]
    Wait Until Element Is Visible    //*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button
    Execute JavaScript    document.evaluate('//*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Wait Until Element Is Visible    id:iframeCsPayModal
    Click Button    //*[@id="csModalWindow"]/div/div/div/div/div/button
    Wait Until Element Is Visible    id:orderhistory-dropdown



ตรวจสอบคำสั่งซื้อ
    Click Element    id:login-dropdown
    Click Element    //*[@id="logincheck"]/a[3]
    Wait Until Element Is Visible    //*[@id="my-orders-accordion"]
    Click Element    //*[@id="my-orders-accordion"]/div[1]
    Click Element    //*[@id="my-orders-accordion"]/div[1]
    Get Text    //*[@id="page"]/div[2]/div[2]/div[2]/div[2]/div[1]
    Get Text    //*[@id="page"]/div[2]/div[2]/div[2]/div[2]/div[3]
    Get Text    //*[@id="page"]/div[2]/div[2]/div[2]/div[5]/div/div/div/div[2]/div[2]
    Get Text    //*[@id="page"]/div[2]/div[2]/div[2]/div[3]/div[1]/div[1]/div/span