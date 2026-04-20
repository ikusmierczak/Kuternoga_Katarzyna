-- Stworzenie widoku zarobków każdej z pracownic
CREATE VIEW widok_zarobki AS
SELECT
    p.imie,
    COUNT(w.id_wizyty) * 20 AS zarobki
FROM pracownice p
LEFT JOIN wizyty w ON p.id_pracownicy = w.id_pracownicy
GROUP BY p.id_pracownicy, p.imie;

-- Wyświetlenie zarobków
SELECT * FROM widok_zarobki;

-- Tworzenie widoku preferencji klientów(dopasowuje pracownicę do upodobań klienta)
CREATE VIEW dopasowanie AS
SELECT
    k.imie AS klient,
    p.imie AS proponowana_dziewczyna,
    p.kolor_wlosow
FROM klienci k
JOIN pracownice p ON k.preferowany_kolor_wlosow = p.kolor_wlosow;

-- Przykładowe użycie rekomendacji
SELECT proponowana_dziewczyna FROM dopasowanie WHERE klient = 'Jaskier';

-- Ranking najczęstszych klientów
SELECT
    k.imie,
    k.nazwisko,
    COUNT(w.id_wizyty) AS suma_wizyt
FROM klienci k
JOIN wizyty w ON k.id_klienta = w.id_klienta
GROUP BY k.id_klienta, k.imie, k.nazwisko
ORDER BY suma_wizyt DESC;