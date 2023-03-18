--создание роли--
create role test login password '0';
grant connect on database scientific_conferences to test;

grant select, insert, update on "Ученый" to test;
grant select, insert, update on "Ученый_организация" to test;
grant select, insert, update on "Ученый_отрасль" to test;
grant select, insert, update on "Ученый_Идентификатор_seq" to test;

grant select, update on "Отрасль_науки" to test;

grant select on "Организация" to test;

--создание представлений--
--вывод занятости ученого (колчиства высуплений для каждого)
create view scientists_employment as
    select У."Фамилия", У."Имя", У."Отчество", count(*) "Количество_выступлений" from "Ученый" У
        join "Общий_список_участия" О on У."Идентификатор" = О."Идентификатор_ученого"
        group by У."Фамилия", У."Имя", У."Отчество" order by У."Фамилия";

create view list_without_doklad as
    select "Идентификатор_ученого", "Идентификатор_конференции", "Подтверждение_участия" from "Общий_список_участия";

grant select on list_without_doklad to test;

create role update_date_conf;
grant update("Подтверждение_участия") on list_without_doklad to update_date_conf;
grant update_date_conf to test;