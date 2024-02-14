*** Settings ***

Library  SeleniumLibrary
Library  OperatingSystem
Variables  ../keywords/Data.py  #Data.py nin içindekileri al kullan diyorum!
Variables  ../locators/Locators.py


*** Keywords ***

Instagram anasayfasina git
    Open Browser     ${Datas.UrlInsta}      chrome    #options=add_argument("--headless") bunu aktif hale getirirsem her test koşumunda chromedan testi açmaz arka planda gerçekleştirir!
    Maximize Browser Window    #ekranı tam hale getirir
    Set Browser Implicit Wait    10s
    #Click Element    ${InsLocators.AccepterCookies}    #çıkan cookies metinine tıklanmasına söylüyorum!
    #cookie metnini çıkarabilmek için instagramı gizli sekmede açman lazım!

Instagram giris sayfasina basari ile baglandigini dogrula
    ${actualFaceBaglanText}      Get Text       ${InsLocators.btnFaceBaglan}                         #InsLocators.btnFaceBaglan daki degeri text olarak al actualFaceBaglanText değerine ata dedik!
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
    ${SifreHataMesaji}      Get Text       ${InsLocators.placeHataMesaji}        #InsLocators.placeHataMesaji daki degeri text olarak al SifreHataMesaji değerine ata dedik!
    Should Be Equal As Strings       ${SifreHataMesaji}       ${Datas.HataMesaji}
    Sleep    3s

Gecersiz kullanici adi gir
    Input Text    ${InsLocators.placeUserName}    ${Datas.InvalidEmail}
    Input Password    ${InsLocators.placePassword}    ${Datas.Password}
    Sleep     2s
    Click Element    ${InsLocators.btnGiris}

Kullanici adi icin hata mesajini dogrula
    ${KullaniciAdiHataMesaji}      Get Text       ${InsLocators.placeHataMesaji}        #InsLocators.placeHataMesaji daki degeri text olarak al KullaniciAdiHataMesaji değerine ata dedik!
    Should Be Equal As Strings       ${KullaniciAdiHataMesaji}       ${Datas.HataMesaji}
    Sleep    3s


Kullanici adi ve sifre alanlarini bos birakip kontrol edin
    ${PlaceUserName}   Get Text    ${InsLocators.placeUserName}
    Should Be Empty    ${PlaceUserName}  #buranın boş olup olmadığını kontrol ediyorum! boşsa geçiyorum!
    ${PlacePassword}   Get Text    ${InsLocators.placePassword}
    Should Be Empty    ${PlacePassword}  #buranın boş olup olmadığını kontrol ediyorum! boşsa geçiyorum!

    ${is_disabled} =  Element Should Be Disabled    ${InsLocators.btnGiris}   #InsLocators.btnGiris butonu disable mı kontrolü yapıyorum! (doğrulama) devre dışı ise is_disabled a true yu atayacak!!
    Run Keyword If    '${is_disabled}' == 'True'     Log    Öge devre disidir    #is_disabled true ise log mesajı yazdırmak için kullanilir.
    #Run Keyword tanımı Operation System Librarysinden gelir!
