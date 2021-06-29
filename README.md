# Matlab_Audiogram

Aplikajca służąca do wykonania przesiewowego badania słuchu - pomaga wskazać potrzebę wizyty u lekarza (NIE ZASTĘPUJE RZECZYWISTYCH KONSULTACJI ZE SPECJALISTĄ).

Dodatkowo pozwala porównać swój słuch z celebrytami (dane nierzeczywiste).

## UWAGA!
Aplikacja generuje dźwięki potencjalnie niebezpieczne dla ucha ludzkiego. Zalecane jest jej uruchomienie z najniższym niezerowym poziomeem głośności systemowej.

### Twórcy:
- Jakub Kołton: 
  https://github.com/jakubkolton
- Kacper Janowski:
  https://github.com/KacperJanowski98

### Funkcjonalność:
- Procedura kalibracji (ustalenia punktu odniesienia głośności systemowej dla tonu 1 kHz).
- Procedura pomiarowa (sprawdzenie osobno czułości obu kanałów słuchu dla tonów z szerokiego pasma częstotliwości typowo słyszalnych przez człowieka). W celu uniknięcia przesłuchów między kanałami, w kanale niebadanym generowany jest losowy szum.
- Wynik ilościowy i słowny komentarz do wyniku badania.
- Możliwość porównania swojego słuchu z celebrytami (dane nierzeczywiste).
- Sekcja pomocy dokładnie tłumacząca całą procedurę.

### Zrzuty ekranu z działania aplikacji:
<img src="https://github.com/jakubkolton/Matlab_Audiogram/blob/Release-v1.1/Screenshots/1.PNG" width="501" height="421" />
<img src="https://github.com/jakubkolton/Matlab_Audiogram/blob/Release-v1.1/Screenshots/2.PNG" width="501" height="421" />
<img src="https://github.com/jakubkolton/Matlab_Audiogram/blob/Release-v1.1/Screenshots/3.PNG" width="501" height="421" />

### Wymagania:
- Do uruchomienia samej aplikacji bez posiadania Matlaba (plik "Turbo Audiogram.exe:):
  - Słuchawki stereo
  - Matlab Runtime (R2021a lub nowszy) pobierany podczas instalacji: https://www.mathworks.com/products/compiler/mcr/index.html
- Do uruchomienia projektu:
  - Matlab R2021a (prawdopodobna kompatybilność wsteczna)
  - wtyczka AppDesigner do Matlaba
