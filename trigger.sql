create or replace function check_date_speak() returns trigger
    language plpgsql as
    $$
    begin
        if (select extract(ISODOW FROM new."Дата_проведения") = 7) then
            raise exception 'В воскресенье не проводятся конференции';
        end if;
        return new;
    end;
    $$;

create or replace trigger check_isodow_new_conf
    before insert or update of "Дата_проведения" on "Конференция"
    for each row execute function check_date_speak();

begin;
update "Конференция"
set "Дата_проведения" = '2023-04-16'
where "Идентификатор" = 1;
rollback;

create or replace function check_company_city() returns trigger
    language plpgsql as
    $$
    begin
        if (new."Город_главного_офиса" = 'Железногорск') then
            raise exception 'Не можем сотрудничать с компаниями из данного города';
        end if;
        return new;
    end;
    $$;

create or replace trigger check_city_new_company
    before insert or update of "Город_главного_офиса" on "Организация"
    for each row execute function check_company_city();

begin;
insert into "Организация"("Название", "Город_главного_офиса", "Телефон")
values ('ООО "Концерн-Авто"', 'Железногорск', '78967876547');
rollback;