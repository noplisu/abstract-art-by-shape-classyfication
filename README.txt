
Grzegorz Lisowski
Wydzia� Informatyki i Nauki o Materia�ach
1 Semestr studia 2 stopnia
specjalizacja Grafika i wizualizacja
przedmiot Grafika Niefotorealistyczna

Poni�szy projekt oparty jest o prac� abstract art by shape classification.
Projekt jest niekompletn� implementacj� zagadnienia opisanego w pracy stworzon� przy pomocy j�zyka programowania R
Projekt zawiera:

folder images w kt�rym znajduje si� 7 przyk�adowych obrazk�w u�ywanych do testowania skryptu.
folder R-Portable zawieraj�cy przeno�n� wersj� interpretera j�zyka R tak aby projekt m�g� by� uruchamiany na ka�dej maszynie
plik run.bat uruchamiaj�cy interpretej j�zyka R i przekazuj�cy do niego skrypt runApp.R
plik runApp.R zawieraj�cy wykonywany algorytm

Spos�b u�ycia programu:

Aby uruchomi� program nale�y wykona� plik run.bat i poczeka� do ko�ca wykonania skryptu.
Gdy skrypt zako�czy prac� konsola w kt�rej si� wykonywa� zostanie zamkni�ta a wynik dzia�ania programu znajdzie si� w pliku Rplots
Aby zmieni� przetwarzane zdj�cie nale�y zmieni� lini� w skrypcie wczytuj�c� zdj�cie
image = readImage("images/photo1.jpg")
na inne ze zdj��.