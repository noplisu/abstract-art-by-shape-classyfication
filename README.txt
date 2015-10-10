
Grzegorz Lisowski
Wydzia³ Informatyki i Nauki o Materia³ach
1 Semestr studia 2 stopnia
specjalizacja Grafika i wizualizacja
przedmiot Grafika Niefotorealistyczna

Poni¿szy projekt oparty jest o pracê abstract art by shape classification.
Projekt jest niekompletn¹ implementacj¹ zagadnienia opisanego w pracy stworzon¹ przy pomocy jêzyka programowania R
Projekt zawiera:

folder images w którym znajduje siê 7 przyk³adowych obrazków u¿ywanych do testowania skryptu.
folder R-Portable zawieraj¹cy przenoœn¹ wersjê interpretera jêzyka R tak aby projekt móg³ byæ uruchamiany na ka¿dej maszynie
plik run.bat uruchamiaj¹cy interpretej jêzyka R i przekazuj¹cy do niego skrypt runApp.R
plik runApp.R zawieraj¹cy wykonywany algorytm

Sposób u¿ycia programu:

Aby uruchomiæ program nale¿y wykonaæ plik run.bat i poczekaæ do koñca wykonania skryptu.
Gdy skrypt zakoñczy pracê konsola w której siê wykonywa³ zostanie zamkniêta a wynik dzia³ania programu znajdzie siê w pliku Rplots
Aby zmieniæ przetwarzane zdjêcie nale¿y zmieniæ liniê w skrypcie wczytuj¹c¹ zdjêcie
image = readImage("images/photo1.jpg")
na inne ze zdjêæ.