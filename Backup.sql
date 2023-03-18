--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-10 12:45:37 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 18677)
-- Name: Доклад; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Доклад" (
    "Идентификатор" integer NOT NULL,
    "Название" character varying(50) NOT NULL,
    "Отрасль_науки" integer NOT NULL
);


ALTER TABLE public."Доклад" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18676)
-- Name: Доклад_Идентификатор_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Доклад_Идентификатор_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Доклад_Идентификатор_seq" OWNER TO postgres;

--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 224
-- Name: Доклад_Идентификатор_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Доклад_Идентификатор_seq" OWNED BY public."Доклад"."Идентификатор";


--
-- TOC entry 223 (class 1259 OID 18664)
-- Name: Конференция; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Конференция" (
    "Идентификатор" integer NOT NULL,
    "Название" character varying(50) NOT NULL,
    "Тематика" text,
    "Город" character varying(20) NOT NULL,
    "Дата_проведения" date,
    CONSTRAINT "Конференция_Город_check" CHECK ((("Город")::text ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'::text)),
    CONSTRAINT "Конференция_Дата_проведения_check" CHECK (("Дата_проведения" > CURRENT_DATE))
);


ALTER TABLE public."Конференция" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18663)
-- Name: Конференция_Идентификатор_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Конференция_Идентификатор_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Конференция_Идентификатор_seq" OWNER TO postgres;

--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 222
-- Name: Конференция_Идентификатор_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Конференция_Идентификатор_seq" OWNED BY public."Конференция"."Идентификатор";


--
-- TOC entry 227 (class 1259 OID 18689)
-- Name: Общий_список_участия; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Общий_список_участия" (
    "Идентификатор" integer NOT NULL,
    "Идентификатор_ученого" integer NOT NULL,
    "Идентификатор_конференции" integer NOT NULL,
    "Идентификатор_доклада" integer NOT NULL,
    "Подтверждение_участия" boolean NOT NULL
);


ALTER TABLE public."Общий_список_участия" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18688)
-- Name: Общий_список_учас_Идентификатор_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Общий_список_учас_Идентификатор_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Общий_список_учас_Идентификатор_seq" OWNER TO postgres;

--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 226
-- Name: Общий_список_учас_Идентификатор_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Общий_список_учас_Идентификатор_seq" OWNED BY public."Общий_список_участия"."Идентификатор";


--
-- TOC entry 215 (class 1259 OID 18602)
-- Name: Организация; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Организация" (
    "Идентификатор" integer NOT NULL,
    "Название" character varying(50) NOT NULL,
    "Город_главного_офиса" character varying(20),
    "Телефон" character varying(11) NOT NULL,
    CONSTRAINT "Организация_Город_главного_офи_check" CHECK ((("Город_главного_офиса")::text ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'::text)),
    CONSTRAINT "Организация_Телефон_check" CHECK ((("Телефон")::text ~ '^(7[0-9]{10})$'::text))
);


ALTER TABLE public."Организация" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18601)
-- Name: Организация_Идентификатор_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Организация_Идентификатор_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Организация_Идентификатор_seq" OWNER TO postgres;

--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 214
-- Name: Организация_Идентификатор_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Организация_Идентификатор_seq" OWNED BY public."Организация"."Идентификатор";


--
-- TOC entry 217 (class 1259 OID 18613)
-- Name: Отрасль_науки; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Отрасль_науки" (
    "Идентификатор" integer NOT NULL,
    "Название" character varying(30) NOT NULL,
    CONSTRAINT "Отрасль_науки_Название_check" CHECK ((("Название")::text ~ '^([А-Я][а-яё]+)$'::text))
);


ALTER TABLE public."Отрасль_науки" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18612)
-- Name: Отрасль_науки_Идентификатор_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Отрасль_науки_Идентификатор_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Отрасль_науки_Идентификатор_seq" OWNER TO postgres;

--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 216
-- Name: Отрасль_науки_Идентификатор_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Отрасль_науки_Идентификатор_seq" OWNED BY public."Отрасль_науки"."Идентификатор";


--
-- TOC entry 219 (class 1259 OID 18623)
-- Name: Ученый; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ученый" (
    "Идентификатор" integer NOT NULL,
    "Фамилия" character varying(20) NOT NULL,
    "Имя" character varying(20) NOT NULL,
    "Отчество" character varying(30),
    "Город" character varying(20) NOT NULL,
    CONSTRAINT "Ученый_Город_check" CHECK ((("Город")::text ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'::text)),
    CONSTRAINT "Ученый_Имя_check" CHECK ((("Имя")::text ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'::text)),
    CONSTRAINT "Ученый_Отчество_check" CHECK ((("Отчество")::text ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'::text)),
    CONSTRAINT "Ученый_Фамилия_check" CHECK ((("Фамилия")::text ~ '^([А-Я][а-яё]+|[A-Z][a-z]+)$'::text))
);


ALTER TABLE public."Ученый" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18622)
-- Name: Ученый_Идентификатор_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ученый_Идентификатор_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ученый_Идентификатор_seq" OWNER TO postgres;

--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 218
-- Name: Ученый_Идентификатор_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ученый_Идентификатор_seq" OWNED BY public."Ученый"."Идентификатор";


--
-- TOC entry 221 (class 1259 OID 18648)
-- Name: Ученый_организация; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ученый_организация" (
    "Идентификатор_ученого" integer NOT NULL,
    "Идентификатор_организации" integer NOT NULL
);


ALTER TABLE public."Ученый_организация" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18633)
-- Name: Ученый_отрасль; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ученый_отрасль" (
    "Идентификатор_ученого" integer NOT NULL,
    "Идентификатор_отрасли" integer NOT NULL
);


ALTER TABLE public."Ученый_отрасль" OWNER TO postgres;

--
-- TOC entry 3476 (class 2604 OID 18680)
-- Name: Доклад Идентификатор; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Доклад" ALTER COLUMN "Идентификатор" SET DEFAULT nextval('public."Доклад_Идентификатор_seq"'::regclass);


--
-- TOC entry 3475 (class 2604 OID 18667)
-- Name: Конференция Идентификатор; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Конференция" ALTER COLUMN "Идентификатор" SET DEFAULT nextval('public."Конференция_Идентификатор_seq"'::regclass);


--
-- TOC entry 3477 (class 2604 OID 18692)
-- Name: Общий_список_участия Идентификатор; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Общий_список_участия" ALTER COLUMN "Идентификатор" SET DEFAULT nextval('public."Общий_список_учас_Идентификатор_seq"'::regclass);


--
-- TOC entry 3472 (class 2604 OID 18605)
-- Name: Организация Идентификатор; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Организация" ALTER COLUMN "Идентификатор" SET DEFAULT nextval('public."Организация_Идентификатор_seq"'::regclass);


--
-- TOC entry 3473 (class 2604 OID 18616)
-- Name: Отрасль_науки Идентификатор; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Отрасль_науки" ALTER COLUMN "Идентификатор" SET DEFAULT nextval('public."Отрасль_науки_Идентификатор_seq"'::regclass);


--
-- TOC entry 3474 (class 2604 OID 18626)
-- Name: Ученый Идентификатор; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ученый" ALTER COLUMN "Идентификатор" SET DEFAULT nextval('public."Ученый_Идентификатор_seq"'::regclass);


--
-- TOC entry 3670 (class 0 OID 18677)
-- Dependencies: 225
-- Data for Name: Доклад; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Доклад" ("Идентификатор", "Название", "Отрасль_науки") FROM stdin;
1	СуперЧеловек - новый биологический вид	2
2	Школа - инкубатор для клонов	10
3	Взаимоотношения собак и кошек	3
4	Спирт - новое химическиое оружие	22
5	Комфортный кампус для каждого	10
6	Библия - как читать и следовать ей	15
7	Западные славяне и их семьи	8
8	Почему хайп и кринж одно и то же	20
9	Алмазы и апатиты Греции	5
10	Рак больше не рак	17
\.


--
-- TOC entry 3668 (class 0 OID 18664)
-- Dependencies: 223
-- Data for Name: Конференция; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Конференция" ("Идентификатор", "Название", "Тематика", "Город", "Дата_проведения") FROM stdin;
1	Россия - вперед к успеху	О будущем нашей страны, его сферах и жизни людей	Москва	2023-09-01
2	Москва-Экспо	Какой станет наша столица через 100 лет	Москва	2024-09-23
3	Прибалтика - богатый край	Этот извесный край таит в себе множество интересного	Казань	2023-10-10
4	Войти в IT	Кто такой айтишник и почему всего его хотят	Москва	2025-10-05
5	Города будущего	Где мы бдуем жить через 100 лет	Казань	2023-12-29
6	Новое слово в новых технологиях	Что прорывного произошло за последние 10 лет	Владивосток	2023-08-13
7	В школе как дома	Как сделать школу комфортной для ребенка	Ижевск	2023-10-30
8	Единство во множестве	Народы России как единое целое	Москва	2024-09-10
9	Карта мира - что и почему	Границы стран, всегда ли они были такими	Казань	2023-09-27
10	Подземный город	Что таит в себе глубина Земли	Сочи	2023-09-09
\.


--
-- TOC entry 3672 (class 0 OID 18689)
-- Dependencies: 227
-- Data for Name: Общий_список_участия; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Общий_список_участия" ("Идентификатор", "Идентификатор_ученого", "Идентификатор_конференции", "Идентификатор_доклада", "Подтверждение_участия") FROM stdin;
1	1	10	5	t
2	8	10	5	t
3	2	2	1	t
4	8	1	6	f
5	8	6	10	t
6	7	10	9	f
7	10	10	9	t
8	1	5	5	t
9	3	3	4	t
10	2	4	1	t
\.


--
-- TOC entry 3660 (class 0 OID 18602)
-- Dependencies: 215
-- Data for Name: Организация; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Организация" ("Идентификатор", "Название", "Город_главного_офиса", "Телефон") FROM stdin;
1	ООО "Новые технологии"	Москва	79078974673
2	ЗАО "Рост"	Рязань	77657898734
3	ООО "Консул-М"	Владивосток	77765897234
4	ОАО "ЮНИОН"	Москва	79023456789
5	ООО "Спорт-Тур"	Казань	77263910463
6	ООО "Ментал-Концерн"	Тула	77640918273
7	ООО "Автогаз"	Ижевск	79047626534
8	ООО "Сибнефтьгаз"	Волгоград	77650910909
9	НИИ "Петроскайн"	Киров	79092089456
10	НИИ "Коллегс-Скайн"	Рязань	79017283948
\.


--
-- TOC entry 3662 (class 0 OID 18613)
-- Dependencies: 217
-- Data for Name: Отрасль_науки; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Отрасль_науки" ("Идентификатор", "Название") FROM stdin;
1	Архитектура
2	Биологические
3	Ветеринарные
4	Географические
5	Минералогические
6	Искусствоведение
7	Исторические
8	Культорология
9	Медецинские
10	Педагогические
11	Политические
12	Психологические
13	Сельскохозяйственные
14	Социологические
15	Теология
16	Технические
17	Фармацевтичиские
18	Физические
19	Математические
20	Филологические
21	Философские
22	Химические
23	Экономические
24	Юридические
\.


--
-- TOC entry 3664 (class 0 OID 18623)
-- Dependencies: 219
-- Data for Name: Ученый; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ученый" ("Идентификатор", "Фамилия", "Имя", "Отчество", "Город") FROM stdin;
1	Рогозин	Петр	Владимирович	Москва
2	Валыдин	Павел	Петрович	Казань
3	Мягкий	Кирилл	Вячеславович	Тула
4	Костолова	Мария	Михайлович	Тыва
5	Петрова	Галина	Алексеевич	Ижевск
6	Косыгин	Илья	Кириллович	Владивосток
7	Митринов	Богдан	Максимович	Сочи
8	Бакунова	Алла	Георгиевич	Волгоград
9	Костылов	Михаил	Ильич	Анапа
10	Магунина	Нина	Александрович	Тула
\.


--
-- TOC entry 3666 (class 0 OID 18648)
-- Dependencies: 221
-- Data for Name: Ученый_организация; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ученый_организация" ("Идентификатор_ученого", "Идентификатор_организации") FROM stdin;
1	10
2	9
3	5
4	5
5	8
6	8
7	1
8	2
9	6
10	7
9	10
8	6
7	4
6	3
5	1
\.


--
-- TOC entry 3665 (class 0 OID 18633)
-- Dependencies: 220
-- Data for Name: Ученый_отрасль; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ученый_отрасль" ("Идентификатор_ученого", "Идентификатор_отрасли") FROM stdin;
1	10
2	9
3	22
4	24
5	1
6	7
7	14
8	17
9	8
10	9
9	11
8	10
7	5
6	20
5	19
\.


--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 224
-- Name: Доклад_Идентификатор_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Доклад_Идентификатор_seq"', 10, true);


--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 222
-- Name: Конференция_Идентификатор_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Конференция_Идентификатор_seq"', 10, true);


--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 226
-- Name: Общий_список_учас_Идентификатор_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Общий_список_учас_Идентификатор_seq"', 10, true);


--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 214
-- Name: Организация_Идентификатор_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Организация_Идентификатор_seq"', 10, true);


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 216
-- Name: Отрасль_науки_Идентификатор_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Отрасль_науки_Идентификатор_seq"', 24, true);


--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 218
-- Name: Ученый_Идентификатор_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ученый_Идентификатор_seq"', 10, true);


--
-- TOC entry 3500 (class 2606 OID 18652)
-- Name: Ученый_организация pk_ученый_организация; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ученый_организация"
    ADD CONSTRAINT "pk_ученый_организация" PRIMARY KEY ("Идентификатор_ученого", "Идентификатор_организации");


--
-- TOC entry 3498 (class 2606 OID 18637)
-- Name: Ученый_отрасль pk_ученый_отрасль; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ученый_отрасль"
    ADD CONSTRAINT "pk_ученый_отрасль" PRIMARY KEY ("Идентификатор_ученого", "Идентификатор_отрасли");


--
-- TOC entry 3506 (class 2606 OID 18682)
-- Name: Доклад Доклад_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Доклад"
    ADD CONSTRAINT "Доклад_pkey" PRIMARY KEY ("Идентификатор");


--
-- TOC entry 3502 (class 2606 OID 18673)
-- Name: Конференция Конференция_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Конференция"
    ADD CONSTRAINT "Конференция_pkey" PRIMARY KEY ("Идентификатор");


--
-- TOC entry 3504 (class 2606 OID 18675)
-- Name: Конференция Конференция_Название_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Конференция"
    ADD CONSTRAINT "Конференция_Название_key" UNIQUE ("Название");


--
-- TOC entry 3508 (class 2606 OID 18694)
-- Name: Общий_список_участия Общий_список_участия_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Общий_список_участия"
    ADD CONSTRAINT "Общий_список_участия_pkey" PRIMARY KEY ("Идентификатор");


--
-- TOC entry 3488 (class 2606 OID 18609)
-- Name: Организация Организация_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Организация"
    ADD CONSTRAINT "Организация_pkey" PRIMARY KEY ("Идентификатор");


--
-- TOC entry 3490 (class 2606 OID 18611)
-- Name: Организация Организация_Телефон_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Организация"
    ADD CONSTRAINT "Организация_Телефон_key" UNIQUE ("Телефон");


--
-- TOC entry 3492 (class 2606 OID 18619)
-- Name: Отрасль_науки Отрасль_науки_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Отрасль_науки"
    ADD CONSTRAINT "Отрасль_науки_pkey" PRIMARY KEY ("Идентификатор");


--
-- TOC entry 3494 (class 2606 OID 18621)
-- Name: Отрасль_науки Отрасль_науки_Название_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Отрасль_науки"
    ADD CONSTRAINT "Отрасль_науки_Название_key" UNIQUE ("Название");


--
-- TOC entry 3496 (class 2606 OID 18632)
-- Name: Ученый Ученый_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ученый"
    ADD CONSTRAINT "Ученый_pkey" PRIMARY KEY ("Идентификатор");


--
-- TOC entry 3513 (class 2606 OID 18683)
-- Name: Доклад Доклад_Отрасль_науки_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Доклад"
    ADD CONSTRAINT "Доклад_Отрасль_науки_fkey" FOREIGN KEY ("Отрасль_науки") REFERENCES public."Отрасль_науки"("Идентификатор") ON DELETE RESTRICT;


--
-- TOC entry 3514 (class 2606 OID 18695)
-- Name: Общий_список_участия Общий_список_уч_Идентификатор__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Общий_список_участия"
    ADD CONSTRAINT "Общий_список_уч_Идентификатор__fkey" FOREIGN KEY ("Идентификатор_ученого") REFERENCES public."Ученый"("Идентификатор") ON DELETE CASCADE;


--
-- TOC entry 3515 (class 2606 OID 18700)
-- Name: Общий_список_участия Общий_список_уч_Идентификатор__fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Общий_список_участия"
    ADD CONSTRAINT "Общий_список_уч_Идентификатор__fkey1" FOREIGN KEY ("Идентификатор_конференции") REFERENCES public."Конференция"("Идентификатор") ON DELETE CASCADE;


--
-- TOC entry 3516 (class 2606 OID 18705)
-- Name: Общий_список_участия Общий_список_уч_Идентификатор__fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Общий_список_участия"
    ADD CONSTRAINT "Общий_список_уч_Идентификатор__fkey2" FOREIGN KEY ("Идентификатор_доклада") REFERENCES public."Доклад"("Идентификатор") ON DELETE CASCADE;


--
-- TOC entry 3511 (class 2606 OID 18658)
-- Name: Ученый_организация Ученый_организ_Идентификатор__fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ученый_организация"
    ADD CONSTRAINT "Ученый_организ_Идентификатор__fkey1" FOREIGN KEY ("Идентификатор_организации") REFERENCES public."Организация"("Идентификатор") ON DELETE CASCADE;


--
-- TOC entry 3512 (class 2606 OID 18653)
-- Name: Ученый_организация Ученый_организа_Идентификатор__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ученый_организация"
    ADD CONSTRAINT "Ученый_организа_Идентификатор__fkey" FOREIGN KEY ("Идентификатор_ученого") REFERENCES public."Ученый"("Идентификатор") ON DELETE CASCADE;


--
-- TOC entry 3509 (class 2606 OID 18643)
-- Name: Ученый_отрасль Ученый_отрасль_Идентификатор_о_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ученый_отрасль"
    ADD CONSTRAINT "Ученый_отрасль_Идентификатор_о_fkey" FOREIGN KEY ("Идентификатор_отрасли") REFERENCES public."Отрасль_науки"("Идентификатор") ON DELETE RESTRICT;


--
-- TOC entry 3510 (class 2606 OID 18638)
-- Name: Ученый_отрасль Ученый_отрасль_Идентификатор_у_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ученый_отрасль"
    ADD CONSTRAINT "Ученый_отрасль_Идентификатор_у_fkey" FOREIGN KEY ("Идентификатор_ученого") REFERENCES public."Ученый"("Идентификатор") ON DELETE CASCADE;


-- Completed on 2023-03-10 12:45:37 MSK

--
-- PostgreSQL database dump complete
--

