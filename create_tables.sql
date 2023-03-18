drop table if exists Общий_список_участия;
drop table if exists Доклад;
drop table if exists Ученый_отрасль;
drop table if exists Отрасль_науки;
drop table if exists Ученый_организация;
drop table if exists Организация;
drop table if exists Ученый;
drop table if exists Конференция;

create table Организация (
    Идентификатор serial primary key,
    Название varchar(50) not null,
    Город_главного_офиса varchar(20) check (Город_главного_офиса ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'),
    Телефон varchar(11) not null unique check (Телефон ~ '^(7[0-9]{10})$')
);

create table Отрасль_науки(
    Идентификатор serial primary key,
    Название varchar(30) unique not null check (Название ~ '^([А-Я][а-яё]+)$')
);

create table Ученый (
    Идентификатор serial primary key,
    Фамилия varchar(20) not null check (Фамилия ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'),
    Имя varchar(20) not null check (Имя ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'),
    Отчество varchar(30) check (Отчество ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'),
    Город varchar(20) not null check (Город ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$')
);

create table Ученый_отрасль(
    Идентификатор_ученого integer not null references Ученый on delete cascade,
    Идентификатор_отрасли integer not null references Отрасль_науки on delete restrict,
    constraint pk_ученый_отрасль primary key (Идентификатор_ученого, Идентификатор_отрасли)
);

create table Ученый_организация(
    Идентификатор_ученого integer not null references Ученый on delete cascade,
    Идентификатор_организации integer not null references Организация on delete cascade,
    constraint pk_ученый_организация primary key (Идентификатор_ученого, Идентификатор_организации)

);

create table Конференция (
    Идентификатор serial primary key,
    Название varchar(50) not null unique,
    Тематика text,
    Город varchar(20) not null check (Город ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'),
    Дата_проведения date check ( Дата_проведения > current_date )
);

create table Доклад (
    Идентификатор serial primary key,
    Название varchar(50) not null,
    Отрасль_науки integer not null references Отрасль_науки on delete restrict
);

create table Общий_список_участия (
    Идентификатор serial primary key,
    Идентификатор_ученого integer not null references Ученый on delete cascade,
    Идентификатор_конференции integer not null references Конференция on delete cascade,
    Идентификатор_доклада integer not null references Доклад on delete cascade,
    Подтверждение_участия boolean not null
)