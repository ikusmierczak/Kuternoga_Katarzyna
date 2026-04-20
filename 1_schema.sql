-- Tworzenie bazy danych
CREATE DATABASE kuternoga_katarzyna;

-- Tworzenie tabel
CREATE TABLE klienci (
    id_klienta SERIAL PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    preferowany_kolor_wlosow VARCHAR(30)
);

CREATE TABLE pracownice (
    id_pracownicy SERIAL PRIMARY KEY,
    imie VARCHAR(50),
    kolor_wlosow VARCHAR(30),
    cena NUMERIC(10, 2)
);

CREATE TABLE wizyty (
    id_wizyty SERIAL PRIMARY KEY,
    id_klienta INT REFERENCES klienci(id_klienta),
    id_pracownicy INT REFERENCES pracownice(id_pracownicy),
    data_wizyty DATE DEFAULT CURRENT_DATE
);

