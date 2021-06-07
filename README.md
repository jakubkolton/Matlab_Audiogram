# Matlab_Audiogram

+ Kalibracja prawego ucha (edytowac funkcje) i lewego tez - bo dzwieki ida na dwa kanaly
+ Legenda 
+ Ladniejsze wyskalowanie wykresu
+ Logika dezaktywacji przyciskow podczas kalibracji, testu itd.
+ Generacja szumu w drugim kanale
- Ostateczna wersja layoutu
- Zerknac na optymalizacje kodu
+ Wyswietlanie zdjec i wynikow artystow, przerobienie programu, aby ich obslugiwal kompletnie
- Komercjalizacja - link do zaprzyjaznionej przychodni i sklepu z aparatami sluchowymi
- Co w przypadku powtorzenia testu? Wymyslic jak "zniknac" wykresy (axes znika, ploty zostaja - chyba dlatego, ze nie sa globalne)
- Przywrocic poprawne dlugosci petli podczas testu
- Krotka instrukcja obslugi programu, zeby klient nie byl pogubiony (on nie zna procedury)

DO KONSULTACJI Z ITK:
- Dodac jakis sztywny offset do kazdego pomiaru (np. 10 dB)
- Zweryfikowac ile czasu maja trwac dzwieki i czy granice uszkodzen sa =80 czy >80 dB
- Jaka ma byc max. glosnosc szumu? Rowna z max. amplituda sinusa? Moze stala?
     Troche glupio, ze slychac ten szum i wiadomo, ze idzie sinus na drugi kanal xD