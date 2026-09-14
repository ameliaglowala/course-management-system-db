# Course & Student Management Database (SQL)

Projekt relacyjnej bazy danych zaprojektowanej dla centrum edukacyjnego, obsługującej zarządzanie grupami zajęciowymi, harmonogramem sal, rozliczeniami płatności oraz kadrą dydaktyczną.

## Architektura i Relacje
Baza danych została znormalizowana i wdrożona w dialekcie MySQL / MariaDB. Uwzględnia klucze główne (`PRIMARY KEY`), klucze obce (`FOREIGN KEY`) oraz więzy integralności referencyjnej:
- **Relacje N:M (wiele-do-wielu):** realizowane m.in. przez tabelę asocjacyjną `uczniowie_w_grupach` łączącą uczniów z dedykowanymi kursami.
- **Harmonogramowanie i zasoby (`grafik`, `sale`):** kontrola pojemności sal oraz powiązanie grup z terminami zajęć.
- **Finanse i rozliczenia (`platnosci`):** ewidencja należności, kwot oraz statusów opłat za dany okres rozliczeniowy.
- **Kadra i przedmioty (`korepetytorzy`, `przedmioty`, `grupy`):** przypisanie nauczycieli do grup wg poziomów nauczania i stawek godzinowych.

## Struktura tabel
- `uczniowie` – dane kontaktowe uczestników kursów.
- `grupy` – profile grup zajęciowych wraz z przypisanym poziomem.
- `uczniowie_w_grupach` – tabela łącząca z datami zapisu.
- `korepetytorzy` – dane wykładowców wraz ze stawkami godzinowymi.
- `przedmioty` – katalog prowadzonych przedmiotów.
- `sale` – rejestr sal dydaktycznych wraz z ich pojemnością.
- `grafik` – plan zajęć z podziałem na sale i dni tygodnia.
- `platnosci` – rejestr wpłat i statusów płatności.

## Technologie
- SQL, MySQL / MariaDB
