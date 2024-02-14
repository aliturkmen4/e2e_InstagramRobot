*** Settings ***

Library  SeleniumLibrary
Resource  ../pages/InstagramPage.robot

Test Setup    Instagram anasayfasina git   #her testi çalıştırmadan önce bunu yap demek! test caselerden önce çalışır(before komutu gibi)
Test Teardown  Close Browser               #Basarili instagram sayfasi testi bittikten sonra browser ı kapatıyor 2.test case e öyle geçer!

*** Test Cases ***
Basarili instagram sayfasi testi
    Instagram giris sayfasina basari ile baglandigini dogrula
    Kullanıcı adi ve sifre gir
    Anasayfaya basarili bir sekilde baglandigini dogrula

Instagram gecersiz sifreyle giris
    Gecersiz sifreyi gir
    Hata mesajini dogrula

