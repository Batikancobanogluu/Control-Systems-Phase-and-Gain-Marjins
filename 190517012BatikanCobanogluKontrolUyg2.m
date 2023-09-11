
%190517012 Batikan Cobanoglu
%soru 3 

pay1=[5]
payda1=[0 0 1]
pay2=[0.1]
payda2=[0 0 1]
pay4=[1]
payda4=[6.75 8.25 1]
G1=tf(pay1,payda1)%KONTROLLÜR TF
G2=tf(pay2,payda2)%KONTROL VANASI TF
G3=series(G1,G2)
G4=tf(pay4,payda4)%TANKLI SİSTEMİN TF
tf(G3)
G(5)=series(G3,G4)
%KOMPLE KAPALI CEVRİM SİSTEM TF BULMAK İÇİN SERİ OLANLARI BİRLEŞTİRİP
%TEK BİR G HALİNE GETİRDİM
pay6=[1]
payda6=[0 0 1]
H=tf(pay6,payda6)
Kapali_Cevrim_TF= feedback (G(5),H,-1)
tf(Kapali_Cevrim_TF)
%marjin bulma kodu matworksden buldum.
margin(Kapali_Cevrim_TF)

w = logspace(-1, 1, 50); % frekans aralığını belirleyin
resp = freqresp(Kapali_Cevrim_TF, w); % frekans cevabını hesaplayın

figure;
bode(Kapali_Cevrim_TF);
grid on;
title('Transfer Fonksiyonunun Frekans Cevabı');




pay=[10]
payda=[1 10 10]
Transfer_Fonksiyonu=tf(pay,payda)
rlocus (Transfer_Fonksiyonu)





