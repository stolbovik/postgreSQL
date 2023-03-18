--сколько выступлений у ученого в заданный проежуток времени--
create or replace function coount_scient_conf_between(integer, date, date) returns integer as
    $$
declare
    count integer = 0;
    str cursor for (select О."Идентификатор_ученого", "Дата_проведения" from "Общий_список_участия" О
                    join "Конференция" К on О."Идентификатор_конференции" = К."Идентификатор"
                    where "Идентификатор_ученого" = $1);
    rec record;
begin
    open str;
    fetch str into rec;
    if not found then
        raise exception 'У ученого нет выступлений в это время';
    else
        loop
            if (rec."Дата_проведения" >= $2 and rec."Дата_проведения" <= $3) then
                count = count + 1;
            end if;
            fetch str into rec;
            exit when not found;
        end loop;
    end if;
    return count;
end
    $$ language plpgsql;

select coount_scient_conf_between(1, '2023-08-08', '2023-11-01');

--подтверждает или отменяет выступления ученых от какой-либо организации--
create or replace procedure confirm_speech_from_organization(varchar, boolean) as
    $$
    declare
        rec record;
        iden_org integer = (select "Идентификатор" from "Организация" where "Название" = $1);
    begin
        for rec in (select * from "Общий_список_участия" О
            where О."Идентификатор_ученого" in (
            select У."Идентификатор_ученого" from "Ученый_организация" У
                join "Организация" О2 on У."Идентификатор_организации" = О2."Идентификатор"
                where "Идентификатор_организации" = iden_org) for update)
        loop
            update "Общий_список_участия" О set "Подтверждение_участия" = $2
                                          where rec."Идентификатор" = О."Идентификатор";
        end loop;
    end
$$ language plpgsql;

call confirm_speech_from_organization('НИИ "Коллегс-Скайн"', false);

--возвращает статус ученого по количеству его выступлений--
create or replace function status_of_scientist(cnt integer) returns text as
    $$
    declare
        count integer = (select count(*) "Количество_выступлений"
                         from "Общий_список_участия" where "Идентификатор_ученого" = cnt
                         group by "Идентификатор_ученого");
        message text;
    begin
        case
            when count between 0 and 2 then message = 'Начинающий';
            when count between 3 and 7 then message = 'Практикующий';
            when count between 8 and 10 then message = 'Профессиональный оратор';
            else message = 'Гуру выступлений';
        end case;
        return message;
    end
    $$ language plpgsql;

select status_of_scientist(1);

