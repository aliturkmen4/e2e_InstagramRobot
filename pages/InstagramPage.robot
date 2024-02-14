*** Settings ***

Library  SeleniumLibrary
Variables  ../keywords/Data.py  #Data.py nin içindekileri al kullan diyorum!
Variables  ../locators/Locators.py


*** Keywords ***

Instagram anasayfasina git
    Open Browser     ${Datas.UrlInsta}      chrome
    Maximize Browser Window    #ekranı tam hale getirir
    Set Browser Implicit Wait    10s
    #Click Element    ${InsLocators.AccepterCookies}    #çıkan cookies metinine tıklanmasına söylüyorum!
    #cookie metnini çıkarabilmek için instagramı gizli sekmede açman lazım!

Instagram giris sayfasina basari ile baglandigini dogrula
    ${actualFaceBaglanText}      Get Text       ${InsLocators.btnFaceBaglan}                         #InsLocators.btnFaceBaglan daki degeri text olarak al soldaki değeri ata dedik!
    Should Be Equal As Strings       ${actualFaceBaglanText}       ${Datas.ExpectedBtnFaceTexti}     #beklenen ve sonuçta alınan sonuç aynı mı karşılaştırdım?  #assortion yaptım!
    Title Should Be    ${Datas.TitleBaglanti}


Kullanıcı adi ve sifre gir
    Input Text    ${InsLocators.placeUserName}    ${Datas.Email}
    Input Password    ${InsLocators.placePassword}    ${Datas.Password}
    Click Element    ${InsLocators.btnGiris}
    Sleep     5s

Anasayfaya basarili bir sekilde baglandigini dogrula
    Title Should Be    ${Datas.ExpectedTextAfterLogin}         #giriş sağlandıktan sonra instagram içerğini görene kadar beklettim gördüyse pass olur!

Gecersiz sifreyi gir
    Input Text    ${InsLocators.placeUserName}    ${Datas.Email}
    Input Password    ${InsLocators.placePassword}    ${Datas.InvalidPassword}
    Sleep     2s
    Click Element    ${InsLocators.btnGiris}

Hata mesajini dogrula
    ${SifreHataMesaji}      Get Text       ${InsLocators.placeHataMesaji}        #InsLocators.placeHataMesaji daki degeri text olarak al soldaki değeri ata dedik!
    Should Be Equal As Strings       ${SifreHataMesaji}       ${Datas.HataMesaji}
    Sleep    3s

