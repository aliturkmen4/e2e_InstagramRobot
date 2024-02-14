*** Settings ***

Library  SeleniumLibrary
Resource  ../pages/InstagramPage.robot

Test Setup    Instagram anasayfasina git   #her testi çalıştırmadan önce bunu yap demek! test caselerden önce çalışır(before komutu gibi)

*** Test Cases ***
Basarili instagram sayfasi testi
    Instagram anasayfasina basari ile baglandigini dogrula
    Kullanıcı adi ve sifre gir
    Anasayfaya basarili bir sekilde baglandigini dogrula

