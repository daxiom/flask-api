--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11
-- Dumped by pg_dump version 14.7 (Homebrew)

-- Started on 2023-03-24 19:20:03 PDT

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
-- TOC entry 207 (class 1259 OID 16415)
-- Name: users; Type: TABLE; Schema: public; Owner: user5SJ
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(1000),
    firstname character varying(1000),
    lastname character varying(1000),
    email character varying(1024),
    sub character varying(36),
    iss character varying(1024),
    creation_date timestamp with time zone,
    middlename character varying(1000),
    idp_userid character varying(256),
    login_source character varying(200)
);


ALTER TABLE public.users OWNER TO "user5SJ";

--
-- TOC entry 206 (class 1259 OID 16413)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user5SJ
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "user5SJ";

--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 206
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user5SJ
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2831 (class 2604 OID 16858)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: user5SJ
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2967 (class 0 OID 16415)
-- Dependencies: 207
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user5SJ
--

COPY public.users (id, username, firstname, lastname, email, sub, iss, creation_date, middlename, idp_userid, login_source) FROM stdin;
379	PT86543				\N	\N	2000-01-04 08:00:00+00	\N	\N	\N
471	bcsc/zib7htdthboyuv7id6jklabpdaor5slp	LIZ MANUEL	ARCHER	\N	07c84721-e0cf-4c81-941c-21a14769e9b8	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-12-08 17:00:35.60167+00	\N	\N	\N
472	idir\\crsmith	Crystal	Smith	\N	7b081eaa-2a8e-470c-aedb-9440f8fc9d42	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-12-08 22:14:53.392766+00	\N	\N	\N
382	dniddrie				\N	\N	2014-10-07 17:32:15+00	\N	\N	\N
473	zpark@bceid	z	\N	\N	79a4f69a-c9d6-48b6-914d-3f40d423bb44	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-12-14 00:29:36.174328+00	\N	\N	\N
474	rtown@bceid	r	\N	\N	34f21731-fe01-44e0-9120-7ed0f24bd1af	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-12-15 18:00:50.227477+00	\N	\N	\N
475	sthorpe@bceid	s	\N	\N	3b40a21e-1c00-494e-a835-26774c28dff3	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-12-15 18:19:35.529856+00	\N	\N	\N
476	fkee@bceid	f	\N	\N	cf65736c-f23e-4696-a015-0c59a490b913	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-12-15 18:28:18.765339+00	\N	\N	\N
386	cjcarlso				\N	\N	2011-04-29 01:10:41+00	\N	\N	\N
477	obuckley@bceid	\N	\N	\N	8d9a617f-3227-4e20-929c-f4f84372216e	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-12-15 18:33:33.276916+00	\N	\N	\N
478	jjonson@bceid	Joan	\N	\N	8db3042d-77ca-463c-93fa-0e832cbb79b9	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-12-15 18:36:55.058163+00	\N	\N	\N
479	jendoe20@bceid	joe20	\N	\N	054371a7-69d0-4db4-8c96-b6bfd215630d	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-12-16 22:51:37.317139+00	\N	\N	\N
480	idir\\tksparks	Kaine	Sparks	\N	0f62f8d8-8929-492e-987e-97e0043c31eb	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-01-10 23:15:45.776038+00	\N	8AB6E68C823B4BA9B619C14B2CB6EC9F	IDIR
481	jendoe20@bceid	joe20 test	\N	\N	cff9afd7-aea5-41aa-950c-aed563811714	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-01-18 17:30:47.599869+00	\N	1DC91815853344CD985A2CFC4DB3F4E9	BCEID
482	bcsc/hhy6mcvaphfsrxwt7wyrqtjlbgt7skkk	DANNY ROBERT	STRINGER	\N	3f39af42-a8f6-4d0b-9073-fef7c1aa2523	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-01-19 16:44:54.607439+00	\N	HHY6MCVAPHFSRXWT7WYRQTJLBGT7SKKK	BCSC
483	idir\\jsevers	Jennifer	Severs	\N	b9e600f5-e8f6-481e-98d3-07e8048f3f0f	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-01-19 17:43:28.430287+00	\N	D76E188715E046B082494451945CDFC2	IDIR
484	jendoe31@bceid	doe31 jen	\N	\N	c261749d-b5a2-4aec-9abd-c6f97181d594	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-01-20 18:18:16.579959+00	\N	BFFEC70DE1504D07AB9AE30CA8B06477	BCEID
485	bcsc/vgmrh22pyggsqnfmtl52ubpkolyhmkcu	MILES GONZALO	MORALES	\N	f87d9baa-4314-49dd-b84f-39ba3a71448e	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-01-26 00:34:29.432428+00	\N	VGMRH22PYGGSQNFMTL52UBPKOLYHMKCU	BCSC
486	idir\\edeng	Eve	Deng	\N	f1095102-dfc3-44cd-9862-7bc872f7bebd	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-01-31 23:07:14.167186+00	\N	4D323303C26C4BD5975FD3F6C17F9CC9	IDIR
487	bcsc/jocxgslo54oopxozrht4uuneaxzhubek	JENNIFER	WALTERS	\N	cb46382d-7696-4f70-a866-1632e52e2444	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-02-06 04:01:49.943471+00	\N	JOCXGSLO54OOPXOZRHT4UUNEAXZHUBEK	BCSC
488	idir\\kjinnah	Kial	Jinnah	\N	08c429a3-a818-4436-a893-bd8b5895c245	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-03-02 00:11:34.390474+00	\N	77816AA6054246C495E08D9CC1E743F4	IDIR
489	idir\\paheath	Patrick	Heath	\N	7976b30c-d1f5-4a19-9942-f4d9ab10fb84	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-03-03 15:07:06.604073+00	\N	E428F5EDE26D41A39C7465E92E334F3E	IDIR
490	bceidqa@bceid	EY QA	\N	\N	0fabec49-475b-4e58-a5f4-654f923c1591	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-03-06 21:31:48.92294+00	\N	51FDE790C9DE4FF5BE88C9B5625CB4D0	BCEID
491	bcsc/rpjmnvmvzpfgpc7o5a24c7fuqlm2juza	BCREGTEST FELECIA	SIXTY	\N	1d41091e-4e04-4604-a7e1-a9a8fb35c152	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-03-07 16:07:18.296525+00	\N	RPJMNVMVZPFGPC7O5A24C7FUQLM2JUZA	BCSC
492	bcsc/zxai3glb7srcf74pgbsi6zvasi3lowqv	BCREGTEST Rosette	TWENTYFOUR	\N	1c03a748-2a44-441c-a98d-2a4b41bdb099	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-03-08 13:06:09.444615+00	\N	ZXAI3GLB7SRCF74PGBSI6ZVASI3LOWQV	BCSC
493	idir\\oanyahur	Oge	Anyahuru	\N	676c9d48-7ace-4b1b-b301-60b5ecc1c514	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-03-13 16:26:08.871893+00	\N	8444E444BC2B4C27994EDEA7CBBEA41D	IDIR
494	bcsc/hzeewmsxll5i32ocsxengzzunumqca4e	BCREG2 Nguyen	TWENTYEIGHT	\N	f6f97dde-4d69-49ea-8276-95389928f66c	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-03-20 22:40:09.920803+00	\N	HZEEWMSXLL5I32OCSXENGZZUNUMQCA4E	BCSC
495	bcsc/3j4jmqabrf5lj6rhcxi32f5tn6wui5ky	BCREG2 Dao	THIRTY	\N	264d4b2a-f5c7-4c6c-9eca-b9f971d90b45	https://test.loginproxy.gov.bc.ca/auth/realms/bcregistry	2023-03-20 22:48:28.127311+00	\N	3J4JMQABRF5LJ6RHCXI32F5TN6WUI5KY	BCSC
380	khorler				\N	\N	2021-12-31 20:22:58+00	\N	\N	\N
239	idir\\brtest2	Business	Registry Test 2		fcff6f51-b667-41db-90f6-3db71613d1b7	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-27 22:29:05.546776+00	\N	\N	\N
383	Corp Online				\N	\N	2020-07-31 21:45:08+00	\N	\N	\N
245	idir\\brtest4	Business	Registry Test 4		ae41ba3b-0907-4c12-81d3-44453b3b1b23	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-06-09 20:12:06.800108+00	\N	\N	\N
283	service-account-entity-service-account	\N	\N	service-account-entity-service-account@placeholder.org	25d0c230-6801-4871-b5f8-16f64d2dfed6	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-01-24 15:35:03.384104+00	\N	service-account-entity-service-account	SYSTEM
384	marklau				\N	\N	2022-01-20 23:04:41+00	\N	\N	\N
387	dalessar				\N	\N	2021-10-28 19:36:26+00	\N	\N	\N
278	bcsc/mylaqrj72ovcdwrukxdsy36l4i4hcxyx	BCREGTEST ANH	SIXTYEIGHT	\N	efd175e2-cabf-4ee5-a140-e9434366b156	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-11-22 17:33:08.133782+00	\N	MYLAQRJ72OVCDWRUKXDSY36L4I4HCXYX	BCSC
280	sb100yopmail@bceid	sb100	\N	\N	f44e8232-8252-4f22-89ad-7087b0205a60	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-01-11 17:54:35.318477+00	\N	30C5252DAA6E4F219CFB0CFFF6128735	BCEID
284	BCROS SERVICE ACCOUNT	\N	\N	\N	8ff8285a-c7e3-4859-9154-394666544692	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-01-24 23:19:43.857649+00	\N	\N	\N
257	bcsc/rxkvflwkrpydhikxx7pnqas526kcbqzq	BCREGTEST MOSES	EIGHTYTHREE	\N	59d9ad20-ca2e-4a3c-a7a5-235e3283d481	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-08-30 22:53:11.240741+00	\N	\N	\N
311	SC93613				\N	\N	2000-01-04 08:00:00+00	\N	\N	\N
381	paheath				\N	\N	2011-04-09 18:16:49+00	\N	\N	\N
314	PK91196				\N	\N	2000-01-04 08:00:00+00	\N	\N	\N
385	DALESSAR				\N	\N	2013-08-21 21:24:38+00	\N	\N	\N
388	vhepburn				\N	\N	2022-06-01 21:45:32+00	\N	\N	\N
389	kovens				\N	\N	2014-10-20 20:54:49+00	\N	\N	\N
390	akrause				\N	\N	2022-06-01 21:59:13+00	\N	\N	\N
391	PA75075				\N	\N	2000-05-04 07:00:00+00	\N	\N	\N
392	ccosto				\N	\N	2022-06-02 16:45:15+00	\N	\N	\N
393	mapalaci				\N	\N	2012-03-03 18:14:01+00	\N	\N	\N
322	PC75075				\N	\N	2000-01-06 08:00:00+00	\N	\N	\N
394	ACBC	Faye	Anstey	argus@highwaythreesolutions.com	\N	\N	2020-06-11 03:39:58+00	\N	\N	\N
324	PQ86737				\N	\N	2000-01-07 08:00:00+00	\N	\N	\N
395	rmonkman				\N	\N	2018-03-07 23:56:09+00	\N	\N	\N
326	PH81928				\N	\N	2000-01-07 08:00:00+00	\N	\N	\N
396	flai				\N	\N	2011-05-05 21:53:08+00	\N	\N	\N
397	laurnixo				\N	\N	2021-07-22 18:00:38+00	\N	\N	\N
329	PS81928				\N	\N	2000-01-07 08:00:00+00	\N	\N	\N
398	regillis				\N	\N	2016-10-05 21:58:17+00	\N	\N	\N
399	mbalaski				\N	\N	2022-07-25 19:27:41+00	\N	\N	\N
400	jplowman				\N	\N	2019-11-06 22:49:18+00	\N	\N	\N
401	kdirkie				\N	\N	2019-08-09 19:47:25+00	\N	\N	\N
402	PE70533				\N	\N	2000-05-17 07:00:00+00	\N	\N	\N
403	dmckinno				\N	\N	2021-08-30 23:54:53+00	\N	\N	\N
404	pstemken				\N	\N	2022-04-29 00:50:11+00	\N	\N	\N
405	gprimeau				\N	\N	2017-07-12 17:04:41+00	\N	\N	\N
406	jweldon				\N	\N	2017-11-07 17:25:24+00	\N	\N	\N
407	lbergero				\N	\N	2022-04-29 00:56:51+00	\N	\N	\N
408	cllo				\N	\N	2020-03-02 23:23:48+00	\N	\N	\N
409	nchaturv				\N	\N	2018-12-21 01:29:53+00	\N	\N	\N
410	PJ52301				\N	\N	2000-07-28 07:00:00+00	\N	\N	\N
411	jamlane				\N	\N	2021-06-16 00:00:01+00	\N	\N	\N
412	PT81928				\N	\N	2000-12-15 08:00:00+00	\N	\N	\N
413	PF91196				\N	\N	2001-06-19 07:00:00+00	\N	\N	\N
414	PV75075				\N	\N	2001-04-11 07:00:00+00	\N	\N	\N
415	PZ81928				\N	\N	2000-01-04 08:00:00+00	\N	\N	\N
416	PT63374				\N	\N	2001-09-10 07:00:00+00	\N	\N	\N
417	laattril				\N	\N	2011-10-20 22:14:35+00	\N	\N	\N
418	PJ81928				\N	\N	2002-05-15 07:00:00+00	\N	\N	\N
419	dtymusko				\N	\N	2013-09-20 21:12:49+00	\N	\N	\N
420	Tjmonagh				\N	\N	2015-04-10 22:35:04+00	\N	\N	\N
421	PY75075				\N	\N	2003-03-28 08:00:00+00	\N	\N	\N
422	PG34067				\N	\N	1992-03-02 20:00:12+00	\N	\N	\N
423	PA63374				\N	\N	2003-04-08 07:00:00+00	\N	\N	\N
424	PA63374				\N	\N	2003-04-08 07:00:00+00	\N	\N	\N
425	PV51053				\N	\N	2003-05-08 07:00:00+00	\N	\N	\N
426	mbailey				\N	\N	2011-05-26 23:04:33+00	\N	\N	\N
427	PJ34067				\N	\N	1988-03-23 16:53:21+00	\N	\N	\N
428	gpaterso				\N	\N	2011-05-12 22:01:38+00	\N	\N	\N
429	mhepburn				\N	\N	2013-12-13 16:59:13+00	\N	\N	\N
430	PY52301				\N	\N	2005-04-21 07:00:00+00	\N	\N	\N
431	PG81928				\N	\N	1995-01-25 08:00:00+00	\N	\N	\N
432	PR52301				\N	\N	2006-03-09 08:00:00+00	\N	\N	\N
433	PI63374				\N	\N	2006-09-15 07:00:00+00	\N	\N	\N
434	melgreen				\N	\N	2012-03-22 18:53:28+00	\N	\N	\N
435	PY34067				\N	\N	2008-07-02 07:00:00+00	\N	\N	\N
436	PH91196				\N	\N	2009-12-17 08:00:00+00	\N	\N	\N
437	IDIRMBAILEY				\N	\N	2011-10-27 16:40:05+00	\N	\N	\N
438	PI70533				\N	\N	1986-04-08 08:00:00+00	\N	\N	\N
439	PY86543				\N	\N	1991-08-28 16:09:57+00	\N	\N	\N
440	PV81928				\N	\N	1999-05-28 07:00:00+00	\N	\N	\N
441	PS51053				\N	\N	2000-01-10 08:00:00+00	\N	\N	\N
442	rebandet				\N	\N	2014-07-11 15:56:40+00	\N	\N	\N
443	IDIRKOVENS				\N	\N	2014-09-10 16:37:35+00	\N	\N	\N
444	KOVENS				\N	\N	2014-09-24 21:17:18+00	\N	\N	\N
447	kncudmor				\N	\N	2011-04-29 20:42:53+00		\N	\N
448	kncudmor				\N	\N	2011-04-29 20:51:33+00		\N	\N
449	hxhogg				\N	\N	2011-05-03 22:02:22+00		\N	\N
450	dhollier				\N	\N	2011-06-17 16:46:53+00		\N	\N
451	KNCUDMOR				\N	\N	2011-08-08 21:34:41+00		\N	\N
452	IDIRMELGREEN				\N	\N	2012-07-16 21:48:04+00		\N	\N
453	gimajore				\N	\N	2013-04-01 14:37:26+00		\N	\N
454	ecrossle				\N	\N	2013-08-23 22:10:48+00		\N	\N
455	DNIDDRIE				\N	\N	2013-12-03 22:12:35+00		\N	\N
456	PQ70533				\N	\N	2000-03-23 22:45:20+00		\N	\N
457	jepaters				\N	\N	2017-09-25 17:22:30+00		\N	\N
458	PC91196				\N	\N	2000-02-01 08:00:00+00		\N	\N
216	idir\\sriyazzu	Syed	Riyazzudin	syed.riyazzudin@gov.bc.ca	6248623a-2b86-498b-a890-dcf14d6e5c01	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 19:36:38.699067+00	\N	13F6333DB636400E84CAAF434138B07A	IDIR
218	idir\\cwulff	Cameron	Wulff	cameron.wulff@gov.bc.ca	d4817d28-48de-4e7a-a3b2-88fa9e8cd3ee	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 21:55:46.259151+00	\N	CCF3423AB9704C0E83A8B23FFBEEF6D0	IDIR
219	idir\\myranovi	Myra	Noviello	myra.noviello@gov.bc.ca	6dd25e7b-f690-4d18-81ce-d8b9f1e0604c	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 22:05:51.600493+00	\N	D2E16654DDB14B49AE41D805B0A27822	IDIR
220	idir\\shealy	Sandra	Healy	sandra.healy@gov.bc.ca	65091a4b-700e-4919-8de2-a276847ae16b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 22:06:36.17937+00	\N	F8270E79E1424E13B616769F45D9AAD5	IDIR
221	idir\\denralph	Dennis	Ralph	dennis.ralph@gov.bc.ca	3218ccc1-3ee2-4fb7-baa6-f3a9e6ececb6	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 22:08:26.719548+00	\N	65A59394714D4122A05D76B5FFC2EE57	IDIR
223	bcsc/6h2jxbghkbnnnogg42kiussolhqoj3qr	BCREGTEST MOSES	FIFTY	\N	dd7f1d27-e2aa-4cba-bd13-dc760a252848	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-30 21:55:51.366034+00	\N	6H2JXBGHKBNNNOGG42KIUSSOLHQOJ3QR	BCSC
224	bcsc/svl6gurl55nhatr25wtzefrp2el44m7u	BCREGTEST Tenisha	TWENTYSIX	\N	9dc2341e-459d-4aa0-ba71-e0fa3b29f3ec	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-03 20:06:32.735904+00	\N	SVL6GURL55NHATR25WTZEFRP2EL44M7U	BCSC
225	bcsc/lxb33th5swiflq7sn6vmwaeopavt6626	BCREGTEST JING	FORTYFIVE	\N	f381e6ae-0ca8-435e-919e-1647429b11cd	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-05 22:55:01.789359+00	\N	LXB33TH5SWIFLQ7SN6VMWAEOPAVT6626	BCSC
226	bcsc/sdsqcixfw7czxwu5jzddwkty3p72od6a	BCREGTEST LEAH	FORTYSIX	\N	31b05310-7954-474a-865a-b45f49fb6d08	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-05 23:20:42.595216+00	\N	SDSQCIXFW7CZXWU5JZDDWKTY3P72OD6A	BCSC
462	idir\\brtest2	BRTEST	2	\N	d606c48a-270f-42ce-83d8-85bfb7e614fa	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-10-14 14:10:14.484566+00	\N	08FE82212408466081EA023CF0EC945D	IDIR
307	idir\\brtest4	BRTEST	4	\N	66d7b34a-2dfb-48f3-bb1f-dfb14c1ae94b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-07-27 23:11:06.92707+00	\N	9360E910F19244B0B56EE8C40CF6F6B7	IDIR
190	bcsc/umdajp63qu2dfiicdr67vko2h2gasjot	BCREG2 Nguyen	FORTYONE	\N	b42c263c-d6f1-4ade-a734-4e606894c10a	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-08 21:06:36.293974+00	\N	UMDAJP63QU2DFIICDR67VKO2H2GASJOT	BCSC
191	regression_tester@bceid	Keeleri	Achu	test@trst.com	3f180786-20a1-48b4-95f9-1203835762da	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-08 22:33:20.502217+00	\N	A0E8930A17A7481A8B4384AF1CAC32F3	BCEID
192	bcsc/bn2yts5t4favxhjhyze7oz5zpmrg357k	BCREGTEST Arlie	THIRTY	\N	5b400eee-f988-43f0-9a8e-893df9ade8de	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-20 20:02:24.942238+00	\N	BN2YTS5T4FAVXHJHYZE7OZ5ZPMRG357K	BCSC
193	bcsc/h2ngp33cnblnnpy252wzrnjsbxlvl27y	BCREGTEST HARRIETT	FORTY	\N	a38e828a-3e4a-4410-8d85-1be229b9495f	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-21 20:47:55.109781+00	\N	H2NGP33CNBLNNPY252WZRNJSBXLVL27Y	BCSC
194	bcsc/w7t5pxb56db6tifzgcbosrnv2kq6i3lo	BCREGTEST Darnell	FIVE	\N	810782cc-b1a7-461f-a4e1-96db01909c2d	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-22 23:01:38.825907+00	\N	W7T5PXB56DB6TIFZGCBOSRNV2KQ6I3LO	BCSC
195	idir\\johnview	Bob	Bowles		52b0f90d-08da-4c71-9ea5-2563ea7668d2	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-26 15:30:51.305308+00	\N	2CE32270D7BC4FD3875B843FF63C54F2	IDIR
197	bcsc/nd7aqqhmc6h7kbaarazq7wr4zzgr6eoi	BCREG2 Della	THIRTYTWO	\N	82e9f6c1-6e9f-444f-b485-6462d38af4a2	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-26 16:03:42.405407+00	\N	ND7AQQHMC6H7KBAARAZQ7WR4ZZGR6EOI	BCSC
198	bcsc/g4mclydsx2dxgr62omusnmtjjmir2s76	BCREG2 Sebastian	THIRTYTHREE	\N	b922380b-6af0-4ba5-b204-ddc3e5baf7c0	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-26 16:15:05.072862+00	\N	G4MCLYDSX2DXGR62OMUSNMTJJMIR2S76	BCSC
199	bcsc/b2oebzf7bf5vk4inwfdsvt4krtja2xhp	BCREG2 Shelby	THIRTYFOUR	\N	6211ad2e-5625-4c99-913b-b9f9ec965218	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-26 16:21:08.20782+00	\N	B2OEBZF7BF5VK4INWFDSVT4KRTJA2XHP	BCSC
200	bcsc/am5m5eqsgplij4fpzqooycz2ex3f2szd	BCREG2 Carlos	THIRTYFIVE	\N	47383ae3-3be6-48da-bd54-fcea823466a4	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-26 21:38:04.339594+00	\N	AM5M5EQSGPLIJ4FPZQOOYCZ2EX3F2SZD	BCSC
201	bcsc/hinnmlfmxxt4eoqq25wxlsx7xnoq7pxq	BCREG2 Luis	THIRTYSIX	\N	11a6162f-1bf6-44f5-ab1f-dc692d532cbd	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-27 16:30:14.157808+00	\N	HINNMLFMXXT4EOQQ25WXLSX7XNOQ7PXQ	BCSC
203	bcsc/x4jeylnnhkztomiy63hprthwje6kx5t4	BCREG2 Hubert	THIRTYSEVEN	\N	e34b863c-2df2-4dba-9401-885906d66d86	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-27 20:57:15.544054+00	\N	X4JEYLNNHKZTOMIY63HPRTHWJE6KX5T4	BCSC
204	bcsc/sdrxrfpdy4d72tapjogvkjak44mdhmlw	BCREG2 Sebastian	ELEVEN	\N	d33e60de-8b71-456b-bbb8-4cfca6f99633	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-27 21:38:50.305508+00	\N	SDRXRFPDY4D72TAPJOGVKJAK44MDHMLW	BCSC
205	idir\\lahall	Lance	Hall	lance.hall@gov.bc.ca	7e62fa18-3b3d-4235-a67e-d8900d48f12b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-27 22:35:19.396259+00	\N	54AFC16075D043C6ADBBEEF92AE4370F	IDIR
206	bcsc/orie4x7qtekd7qv7hzqvm265bupwxjm5	BCREGTEST Jamael	THREE	\N	672563ea-31a4-4d0b-a888-c4f3a35ea04f	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-27 22:50:13.883797+00	\N	ORIE4X7QTEKD7QV7HZQVM265BUPWXJM5	BCSC
208	bcsc/wswi7se6tpaso5jwg663by5ybgr5g4z2	BCREG2 Benjamin	THIRTYNINE	\N	fca2fcac-fe5a-4815-b068-14cdbca3e55b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-27 23:21:22.221515+00	\N	WSWI7SE6TPASO5JWG663BY5YBGR5G4Z2	BCSC
209	bcsc/xblgqznkmwgdhuqgcu4ydkaqv66r7y6y	BCREG2 Liang	FORTY	\N	78899492-2115-4095-8b41-211b38fefbb3	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-27 23:46:43.619144+00	\N	XBLGQZNKMWGDHUQGCU4YDKAQV66R7Y6Y	BCSC
210	bcsc/gga2hf22leoygbiy2rs4ufeh53yuxhh3	BCREG2 Hang	FORTYTWO	\N	9f6cc5ef-65d3-4c0d-9f1d-16dbb4ef560d	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-28 02:27:54.113977+00	\N	GGA2HF22LEOYGBIY2RS4UFEH53YUXHH3	BCSC
211	bcsc/lvyw4cbumorr66k7f2uq2i3mzcqrm4av	BCREG2 Della	FORTYTHREE	\N	a0bb62ae-f8f8-4429-ad29-27dff3875c9e	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 03:48:55.398782+00	\N	LVYW4CBUMORR66K7F2UQ2I3MZCQRM4AV	BCSC
212	idir\\dclancy	Deirdre	Clancy	deirdre.clancy@gov.bc.ca	560bc5d0-1f09-4b6d-9a34-d9ba1b68d4f3	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 18:07:36.723062+00	\N	9F53228E3A6B4DCCBFE7562BB2CAE606	IDIR
214	idir\\jharding	Julie	Harding	julie.harding@gov.bc.ca	01dfc166-0224-4b04-b13d-1d724c133db7	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 18:07:42.429013+00	\N	389F7CB9B10C44FF963A2163200995DC	IDIR
215	idir\\brmorgan	Bruce	Morgan	bruce.morgan@gov.bc.ca	03c1cc41-09fe-4827-80a7-c201568d4c08	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 18:12:48.204352+00	\N	B26F5D2CCED84D0E8FB122465B06734E	IDIR
227	idir\\cbowler	Cameron	Bowler		8a00d7b4-9bd9-438b-98f0-22bee7537659	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-06 21:33:13.561008+00	\N	CD36CCBE7E524ED897C5D2380830524B	IDIR
228	idir\\apestana	Andre	Pestana		69a16ea0-edd0-414b-a0db-2ab2ee17c5fe	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-07 22:22:46.223804+00	\N	49DD64FA8DF747B283664A465533D1A1	IDIR
230	bcsc/i4xqw4b6bev7a5zjy5m26kmvcc3lh2oq	BCREGTEST Dena	TWENTYNINE	\N	40cf74a9-177b-4f7e-85a5-7be5a929d530	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-11 18:24:38.30881+00	\N	I4XQW4B6BEV7A5ZJY5M26KMVCC3LH2OQ	BCSC
231	testacc1.30@bceid	Milan	Kaur	m1@mailinator.com	6332b78f-8c5e-4b78-9c4a-5c5357fcf848	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-12 15:03:43.695626+00	\N	4A02B2DD3B3A4B40AC3BED4D2AABEBE5	BCEID
232	testacc1.31@bceid	Milan	Kaur	m1@mailiantor.com	02219a20-4219-462d-8c1f-75037619cc38	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-12 15:21:01.321673+00	\N	2C8F110DCC994B91944088AD566F9067	BCEID
276	bcsc/ex4bghw7jpt3e4brhojeoltiljfog5ol	BCREG2 Shelby	FORTYSEVEN	\N	dffbb60b-872f-4661-9afb-db36bf71d09f	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-10-28 15:54:42.495494+00	\N	EX4BGHW7JPT3E4BRHOJEOLTILJFOG5OL	BCSC
277	bcsc/kercncntuufkvbdbv2du5m47cuxiokvv	BCREGTEST Charlene	FOURTEEN	\N	cf420ac0-c78d-43ee-ab07-f41dfef6d71b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-11-15 18:50:22.704212+00	\N	KERCNCNTUUFKVBDBV2DU5M47CUXIOKVV	BCSC
279	bcsc/5racbkf4dulhgpfwp4oi2ogrrhbzrrvz	FOI Huong	FIVE	\N	c010f95a-bdbb-44d2-aa57-167b54f4ed89	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-12-09 22:11:48.561303+00	\N	5RACBKF4DULHGPFWP4OI2OGRRHBZRRVZ	BCSC
281	bcsc/y4rkfrl6jkyn4jygou6x7aes7wzo2c7b	BCREGTEST Bian	SEVENTEEN	\N	cc98c4ff-c876-4592-a99d-be1062cb1648	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-01-11 19:17:35.573682+00	\N	Y4RKFRL6JKYN4JYGOU6X7AES7WZO2C7B	BCSC
282	tommytester@bceid	Tommy	\N	\N	d417e67b-8f04-4caa-a13c-74a23ca17f55	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-01-14 00:17:36.799278+00	\N	1648143EB1BA42538BACC0BD92801C10	BCEID
234	bcsc/bd4qocsz6hinymzan6nv4obadcclp6go	BCREG2 Chun	THIRTEEN	\N	5db40bf3-3d88-432b-b886-b9213b0e7581	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-13 20:56:09.014826+00	\N	BD4QOCSZ6HINYMZAN6NV4OBADCCLP6GO	BCSC
236	bcsc/ao4apowdn4jtqylm22zcyc62mk2dqbo5	BCREGTEST Dao	TWENTYEIGHT	\N	5301ed9f-a42e-4a71-9b3a-32de0b96fa1f	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-18 15:43:13.136206+00	\N	AO4APOWDN4JTQYLM22ZCYC62MK2DQBO5	BCSC
237	idir\\skariyil	Sumesh	Kariyil	sumesh.p.kariyil@gov.bc.ca	6cc2a4fe-dbce-4be1-ae7d-c706d63592ac	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-19 20:53:29.89402+00	\N	59656B96A92F4129893207AFAB919210	IDIR
238	idir\\brtest5	Business	Registry Test 5		1606480e-fa82-440e-8482-5dc5f013a7c7	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-20 04:22:56.669852+00	\N	60C1FB5972C84D68A052DC428A8A08E1	IDIR
241	bcregjulieh@bceid	JULIE	HARDING	julie.harding@gov.bc.ca	57f7b2a3-067b-463a-840f-856f4ce15666	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-28 21:20:27.017496+00	\N	C8E909284F8C4B5AB8D9542E011BC53A	BCEID
242	bcsc/dscqitpy4whbaxyvnwuont33bvcsmt26	BCREGTEST EUGENA	FIFTYONE	\N	97fa6a02-5a84-4f8a-9c3d-a7fb8ba323a5	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-06-02 16:55:41.48518+00	\N	DSCQITPY4WHBAXYVNWUONT33BVCSMT26	BCSC
243	bryanbell@bceid	Bryan	Bell	melissa.stanton@gov.bc.ca	2746fd8f-771f-4e88-ac6f-a2d071a4cf52	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-06-02 21:41:41.521726+00	\N	B006D3A609C04ED19B766A237A598871	BCEID
246	bcsc/663n252itipb4jfaonvtbp3mwip6vzsb	BCREGTEST Jeong	SIX	\N	39d3171e-5fb4-4407-9ddb-8b5f7225ef1a	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-06-10 16:37:11.014115+00	\N	663N252ITIPB4JFAONVTBP3MWIP6VZSB	BCSC
247	bcsc/wvxpkzsopu6biqczam52n47m7gmck6od	BCREGTEST Lin	TWENTYTHREE	\N	7b223f16-1abc-402b-b6b7-72120d0f7885	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-06-10 16:47:06.599451+00	\N	WVXPKZSOPU6BIQCZAM52N47M7GMCK6OD	BCSC
248	lindajervis@bceid	Linda	Jarvis	test@test.ca	a1e4b153-aa4f-4b88-84b5-6d001fd43eb6	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-06-17 16:56:50.413224+00	\N	68470A2054024540B0BF355147C9E31E	BCEID
249	bcsc/w2t2gdms437jvpowx7dwx7zab4x7bww5	BCREG2 Tenisha	TWENTYSEVEN	\N	cd81051a-4f0d-41d7-b9a5-f3e856bcc66b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-06-17 17:33:55.417727+00	\N	W2T2GDMS437JVPOWX7DWX7ZAB4X7BWW5	BCSC
251	bcsc/pli57fm2eokhikj6je3gxliknk7g2yfj	BCREGTEST Alfredo	TWO	\N	04f3c306-581d-47fb-ae29-18b61959fc63	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-07-08 22:21:37.653779+00	\N	PLI57FM2EOKHIKJ6JE3GXLIKNK7G2YFJ	BCSC
252	bcsc/zgcbnhm6u7fprxi7ajt6kff7gsky43ta	BCREG2 Ayisha	FIFTY	\N	248a143e-54ab-4c69-ac39-ae50c806cbaa	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-07-23 21:13:39.690314+00	\N	ZGCBNHM6U7FPRXI7AJT6KFF7GSKY43TA	BCSC
253	idir\\archiu	Argus	Chiu		41981bf4-b60a-43e7-a5de-77c88b18e4b2	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-07-30 13:33:23.831984+00	\N	9B7E8F06D6174D1D9EC3D528EBE27C03	IDIR
254	bcsc/c272kovlg2knludndfrstiklgufitypx	BCREGTEST Bashshar	TWENTYTWO	\N	40a700f8-aed2-463a-8246-55ce1e220a6d	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-08-10 18:39:10.942822+00	\N	C272KOVLG2KNLUDNDFRSTIKLGUFITYPX	BCSC
255	bcsc/zdo5bh3i4cbofpbz6pk3efn3cs4wvn2h	BCREGTEST Hang	FOUR	\N	dbdff84e-9252-4458-9078-2454f9ef7be6	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-08-10 20:44:21.737193+00	\N	ZDO5BH3I4CBOFPBZ6PK3EFN3CS4WVN2H	BCSC
256	bcsc/hdf3dyqeqhpumuompqc2bafirdlvowk6	BCREG2 Svetlana	FOURTEEN	\N	c1b634e8-2525-4a8b-b3ec-0133949a9ecb	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-08-20 22:31:14.125262+00	\N	HDF3DYQEQHPUMUOMPQC2BAFIRDLVOWK6	BCSC
258	bcsc/qohokery5rmyfpfmuqgywjl355ciqrnc	BCREGTEST Kerrie	NINETEEN	\N	b9586915-f5dc-4938-8e89-c79e9857e578	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-02 18:23:19.76894+00	\N	QOHOKERY5RMYFPFMUQGYWJL355CIQRNC	BCSC
259	idir\\s2beauva	Severin	Beauvais	severin.beauvais@gov.bc.ca	1c9063bd-88f1-4e0b-836d-ca0a978653f4	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-09 18:07:22.591991+00	\N	0C5121BAB4C54743878BDF51CCC69AF1	IDIR
260	idir\\rkim	Roy	Kim	roy.kim@gov.bc.ca	ed786a93-bd11-49f3-8ae3-f247bf7f2495	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-14 20:44:12.769641+00	\N	E3BA19EBF1604170A82C6C5D1CEC32B7	IDIR
261	idir\\jnrogers	Janis	Rogers	janis.rogers@gov.bc.ca	b6bde4ce-b75d-484f-961b-75f644ea66bf	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-17 22:16:20.930726+00	\N	6EE294EB81254A21A061A5E1FFCF55BB	IDIR
263	cwulff234@bceid	Cameron	Wulff	cam.wulff@hotmail.com	6d32b3ec-760a-4c1c-bdb4-1d5704b7a42e	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-22 20:06:23.422995+00	\N	FFB155595253462A83E47896FF6F6806	BCEID
264	bcsc/e3iooqpkgjz3emmwajpdyvjwrxwiowkg	BCREGTEST Ciara	FIFTEEN	\N	2b9c6612-2fae-4fa6-8ee2-08c400ce461b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-23 07:36:01.228592+00	\N	E3IOOQPKGJZ3EMMWAJPDYVJWRXWIOWKG	BCSC
265	bcsc/uzlfhbx5umpxnfujfkagy23d6dlaba5b	BCREGTEST Jamael	SEVEN	\N	8818728d-81e8-49df-b743-d6f39fcd8a80	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-23 07:50:44.632282+00	\N	UZLFHBX5UMPXNFUJFKAGY23D6DLABA5B	BCSC
266	gsantana@bceid	Georgia	Santana	testoutputs@gov.bc.ca	f056032a-fc59-4f99-88a3-eeb077a42e68	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-23 20:11:42.520591+00	\N	542506FCDB74474695F8666F12774B1E	BCEID
267	idir\\sarkumar	Saravan	Kumar	saravan.kumar@gov.bc.ca	bb62cc1f-b5f9-4854-a20a-404c7be0c42d	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-27 18:33:52.881555+00	\N	4EDBF2E99A0F438FB75A177565B42C91	IDIR
269	bcsc/t6dxo7efcgo2w5oty7e3hnic63akwsc5	BCREG2 Ulla	FORTYNINE	\N	a15fbbdd-a51d-4acb-b6d0-aa1fd10af62f	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-29 20:07:04.371051+00	\N	T6DXO7EFCGO2W5OTY7E3HNIC63AKWSC5	BCSC
270	bcsc/e5aytcvxz2ys5ksxkukkvi66hutvi5v4	BCREG2 Moses	FORTYEIGHT	\N	3db8003a-574d-492b-9a75-93ba779d0b71	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-29 20:11:12.545926+00	\N	E5AYTCVXZ2YS5KSXKUKKVI66HUTVI5V4	BCSC
271	bcsc/gs64iiy6z6aqyq5nalup7sctf2fmmxk2	BCREG2 Tyisha	FORTYFIVE	\N	7ce45377-2d75-41e4-96b7-0f9bd04f4119	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-29 20:11:36.306194+00	\N	GS64IIY6Z6AQYQ5NALUP7SCTF2FMMXK2	BCSC
272	bcsc/ndelz4lmyrayggmzf4xmdsqdupvue2tu	BCREG2 Idella	FORTYSIX	\N	22b0cadf-ea38-4a9d-99b6-68019e194112	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-29 20:39:59.1325+00	\N	NDELZ4LMYRAYGGMZF4XMDSQDUPVUE2TU	BCSC
273	idir\\jkumar	Jyoti	Kumar	jyoti.kumar@gov.bc.ca	04dae683-3224-460b-8a19-8ce46fee491c	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-10-04 21:51:41.193227+00	\N	90BA0541294343E190FE89D01DD814F2	IDIR
275	bcsc/iaptaestlb6ita56a3sqwhvvdulxqsl5	BCREGTEST Rosette	ELEVEN	\N	5350d4ce-036c-4535-8215-9f322586a7f2	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-10-07 15:42:40.665967+00	\N	IAPTAESTLB6ITA56A3SQWHVVDULXQSL5	BCSC
285	idir\\ccarlson	Catherine	Carlson	\N	f6f6a1d0-ecf5-4003-93ac-43990636a928	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-01-26 23:26:03.651859+00	\N	5E242A0DC7144AC4B5DFCB2D9B6AFD38	IDIR
286	servicefeengov@bceid	Rai	\N	\N	0b0c135a-bca3-4255-85c2-f7c2758b6672	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-03-01 04:40:51.031041+00	\N	76D0B444F2EB4D01BD69087EAF694EC1	BCEID
287	idir\\lmallika	Lekshmi	Mallika	\N	0987a23e-6d41-4830-8973-ed60f61239bc	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-03-14 22:10:09.576445+00	\N	6459B7792FD44C568EB984EBD1276F57	IDIR
288	bcsc/5d3hept3xqd4jq2qe4el5o5detngsipb	SARAH ANNA	EVANS	\N	8b1f912a-32d0-4290-b1d2-ffa67226b459	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-03-16 17:02:40.572217+00	\N	5D3HEPT3XQD4JQ2QE4EL5O5DETNGSIPB	BCSC
289	bcsc/smcau6uwayol4kchuy3q5l5sfbfqxgdu	BCREG2 Zita	TEN	\N	4f8b2aab-5190-425d-b9eb-1963f94e5d9f	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-04-04 21:17:24.320014+00	\N	SMCAU6UWAYOL4KCHUY3Q5L5SFBFQXGDU	BCSC
1	bcsc/bhgv525caao6ujjvqvc7rqhs2eea2od3	BCREGTEST Dalia	ONE	\N	39336052-3d55-4c44-9cd8-215c1b80acc7	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-01 17:42:53.215138+00	\N	BHGV525CAAO6UJJVQVC7RQHS2EEA2OD3	BCSC
184	bcsc/malpaovmqyxtxfdu47z54mwswuerbdni	BCREGTEST Delbert	TWENTYFIVE	\N	a6dd0446-4ddb-42aa-bf46-e623671659f3	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-06 22:12:18.92639+00	\N	MALPAOVMQYXTXFDU47Z54MWSWUERBDNI	BCSC
189	bcsc/pmd3qdz4hzr3hpwbm7jwufel6flpqtyj	BCREGTEST Lucille	TWENTY	\N	131286fc-1a25-4c58-a3ff-377ce92b05a6	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-08 20:25:25.057876+00	\N	PMD3QDZ4HZR3HPWBM7JWUFEL6FLPQTYJ	BCSC
196	bcsc/lksuqzuwujmx6nowuywqwxdyk2txc7jn	BCREG2 Deirdre	THIRTYONE	\N	46461979-8921-4abc-8fdb-0f46206e13e7	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-26 15:52:34.262348+00	\N	LKSUQZUWUJMX6NOWUYWQWXDYK2TXC7JN	BCSC
202	idir\\mikaur	Milan	Kaur	milan.kaur@gov.bc.ca	566315b1-0095-4406-96a7-2fd9cdb5c9e5	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-27 17:59:48.176002+00	\N	110875ADB5B64452BCF1FE8633C4BAD2	IDIR
207	bcsc/lk6ok76h644lkxve5xiymu4hovfhfgvb	BCREG2 Rachel	THIRTYEIGHT	\N	2fbdce8a-78bd-456e-9093-fc713e13cbc8	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-27 23:12:10.929277+00	\N	LK6OK76H644LKXVE5XIYMU4HOVFHFGVB	BCSC
213	idir\\tnewnham	Tanya	Newnham	tanya.newnham@gov.bc.ca	79e44126-1d38-4f77-bf8b-6e1e61279098	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 18:07:40.934555+00	\N	4159EA7229D0424796F79B998E5030C0	IDIR
217	bcsc/s6ob4uzy6z7ts32nqwsa5fsibhllsohk	BCREGTEST Felecia	TEN	\N	0e987e44-f916-4977-af7f-fe7a1cfd11a3	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-29 20:59:43.903846+00	\N	S6OB4UZY6Z7TS32NQWSA5FSIBHLLSOHK	BCSC
222	bcsc/x5levvougen54gnvtvcyh7nrelqcyt4t	BCREGTEST Delphia	EIGHTEEN	\N	ef5e5ce6-6419-4cfb-89cd-477ecd6de074	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-30 18:11:34.735441+00	\N	X5LEVVOUGEN54GNVTVCYH7NRELQCYT4T	BCSC
229	idir\\sblumste	Sienna	Blumstengel	sienna.blumstengel@gov.bc.ca	272948df-73b0-4fe8-a466-e7ae5ac6472c	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-11 16:26:07.63197+00	\N	65E17316D45D4D2DAD13E32ABB554051	IDIR
233	testacc1.33@bceid	Milan	kaur	m1@mailinator.com	49913776-4aeb-44e8-99f6-9542901da111	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-12 15:53:03.293395+00	\N	D0CD2E7D60854780A0BED3BEAFCE7116	BCEID
235	bcsc/xmr6tzlvyvkfl77shozmrithlmthbpf6	BCREGTEST ELVIN	FORTYONE	\N	b00304c5-db15-412d-b53f-beeadbf34250	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-17 15:14:21.843427+00	\N	XMR6TZLVYVKFL77SHOZMRITHLMTHBPF6	BCSC
240	dylanhaggard@bceid	Dylan	Haggard	test@test.ca	91f63201-b58e-41ca-a5bf-ed52bb0d2c5e	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-05-28 16:49:07.137909+00	\N	D2510A76865D4299BBD9236D7DC61FD0	BCEID
244	bcsc/pdgqxqraonvnwckc4aliihnivefb6aw2	BCREGTEST Sebastian	EIGHT	\N	b395a541-d56c-4222-99da-86709127d91b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-06-04 23:11:07.770635+00	\N	PDGQXQRAONVNWCKC4ALIIHNIVEFB6AW2	BCSC
250	bcsc/fyd76wbcng76cpxbu42hhua4qphtivb5	BCREGTEST Bena	THIRTEEN	\N	e96f860f-7a13-41c9-ae3f-e5e30a5c0218	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-06-23 22:47:50.818037+00	\N	FYD76WBCNG76CPXBU42HHUA4QPHTIVB5	BCSC
262	bcsc/noxrb3djkessurxv6houqvrramggyvcp	BCREGTEST LUCILLE	FORTYTHREE	\N	0303bd8c-ccc8-4ce1-ac5f-a1304e5f3d7c	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-21 22:16:19.991152+00	\N	NOXRB3DJKESSURXV6HOUQVRRAMGGYVCP	BCSC
268	bcsc/vbjzink7blbg3xqe7htur7ymnxy5hlwb	BCREG2 Jamael	TWENTYSIX	\N	18422b12-1928-4e83-ae5c-74bc545c7407	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-09-29 17:37:19.373869+00	\N	VBJZINK7BLBG3XQE7HTUR7YMNXY5HLWB	BCSC
274	idir\\hacharya	Hemin	Acharya	hemin.acharya@gov.bc.ca	65dfde49-0782-4dd9-bba0-40a04bf55afa	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-10-06 21:47:57.122002+00	\N	0C336D2246844008B9AF3128AF4E6FF1	IDIR
290	bcsc/ucome2cs7aal4tincsnzf2xmmpvbsun3	BCREGTEST HARRIETT	FIFTYTHREE	\N	e30dfeda-a88c-45a7-a695-9b3a9316a4df	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-04-26 18:39:12.34409+00	\N	UCOME2CS7AAL4TINCSNZF2XMMPVBSUN3	BCSC
291	bcsc/hl5t3qxaimzaitorjdggnyjhx5aybysr	KENDRA	SAUNDERS	\N	51c26d54-fc87-4ae8-a24b-10aa7571f9b6	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-05-03 15:17:56.235047+00	\N	HL5T3QXAIMZAITORJDGGNYJHX5AYBYSR	BCSC
292	idir\\asmehta	Ashna	Mehta	\N	e86e8296-2de1-4db7-a5da-8dfd2f5eabbb	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-05-04 21:42:16.321404+00	\N	ECC5D8D4C55B4DA987F0F79F467417AA	IDIR
293	test_j101@bceid	jen	\N	\N	c2666fe7-8e65-407b-9ab7-239c5413a2f1	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-05-09 18:43:01.733108+00	\N	F0494A046D9840E0A83E05781F3110B2	BCEID
294	idir\\jenchan	Jenny	Chan	\N	1b2f1c83-b03b-48ab-8b1a-26a2ad2c65a2	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-05-09 18:45:20.580435+00	\N	A8892FCE094747C685E36FA3A6222B1D	IDIR
309	idir\\ywolf	Yasmin	Bellanger	\N	8b958079-be1a-4d30-abd3-e66fe3e6e1ba	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-08-18 22:27:04.376287+00	\N	CBD44EDB91B945998A2100DF9887F407	IDIR
310	idir\\eespinos	Elizabeth	Espinosa	\N	25b899e5-c473-4b83-91bf-e371b1977510	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-08-18 22:37:54.152745+00	\N	2574BF8A819A489BAF2DD30AFAD54C86	IDIR
445	idir\\debblyth	Debbie	Blyth	\N	98e75d89-c662-42d5-835c-307b1def34d5	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-09-20 20:16:04.66103+00	\N	C252D0AB78B04A4588EB522AD7EEC9C9	IDIR
446	idir\\eborrows	Erin	Borrows	\N	364edb2c-ea0a-44d2-8296-0461a9aa94ab	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-09-20 22:10:08.519247+00	\N	F174055EF91744B48EC50075AF1CC541	IDIR
459	jendoe4@bceid	doe4	\N	\N	ff4f3e96-2d16-4b61-bdc8-3a329b6a44e6	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-10-05 22:02:50.866325+00	\N	101A20BC72B14268915700694A1DEE47	BCEID
461	test_june28@bceid	Tester	\N	\N	9e62c076-2f19-41b4-8324-67189756260b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-10-12 16:51:27.876205+00	\N	79AC984EFA7D46D1B0C97AC10D3AEE46	BCEID
463	bcsc/smb5xdzjv4orgdb5emvu7ffjrmk4talu	BCREGTEST CARLOS	THIRTYONE	\N	a90263d0-669f-4fdd-8609-82475f105c54	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-10-14 18:08:53.965309+00	\N	SMB5XDZJV4ORGDB5EMVU7FFJRMK4TALU	BCSC
464	hellofresh@bceid	adf	\N	\N	82653ce2-2e7a-4f3b-8a74-82192f6565d5	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-10-19 18:52:25.63745+00	\N	DB267867086A474089AB4557A93D8548	BCEID
465	idir\\trsemple	Travis	Semple	\N	40d654fe-2654-4121-ba9a-44d770f2107b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-10-21 20:12:16.737221+00	\N	30F5100621714F369FDF8C46B9604BC3	IDIR
466	bcsc/vovy42rl4xgf67rf625le4nlywjbvcoc	BETTY ROSS	TALBOT	\N	eca7d2fb-a733-49fd-b830-6b9db27bcf5b	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-10-25 21:39:35.024561+00	\N	VOVY42RL4XGF67RF625LE4NLYWJBVCOC	BCSC
467	bcsc/yrstvyoa27b3gqs732mcyvuqe3t5cst5	BCREGTEST BENJAMIN	THIRTYSIX	\N	91fea751-9e25-4a1c-937a-f15f78a0b212	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-10-31 14:35:53.841302+00	\N	YRSTVYOA27B3GQS732MCYVUQE3T5CST5	BCSC
182	bcsc/wgddz2hj3qnpjjjbowicf2oxpsqi5jd4	BCREGTEST Chapa	NINE	\N	7f47bf2e-a773-4801-8cee-c9f5863d3b7c	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-01 23:05:43.937179+00	\N	WGDDZ2HJ3QNPJJJBOWICF2OXPSQI5JD4	BCSC
183	bcsc/gg2ve3to6hieneivxsdblb6ew7t6fuui	BCREGTEST Felecia	TWELVE	\N	7a124ac1-bed7-413f-bbbb-166fcc6178a6	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-05 21:42:29.819249+00	\N	GG2VE3TO6HIENEIVXSDBLB6EW7T6FUUI	BCSC
185	bcsc/u3j7tjjb5o7m7va76augpz3yg7r3xaho	BCREG2 Gregory	TWENTYNINE	\N	0d797088-d8ab-4575-a49b-0e79162bf4d0	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-07 14:11:18.389162+00	\N	U3J7TJJB5O7M7VA76AUGPZ3YG7R3XAHO	BCSC
186	idir\\lmcclung	Linda	McClung	linda.mcclung@gov.bc.ca	8d46dfd6-b6cc-4cc8-85c7-d3f7b704b842	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-07 14:18:06.300403+00	\N	D408A710A3844129B531E9B5E3F6DDC7	IDIR
187	bcsc/57spk63dsrounzvjloc6ycgev7numn3t	BCREG2 Delbert	FORTYFOUR	\N	d831d4a6-b85f-4061-8d23-353cdde172bb	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-08 18:22:02.36523+00	\N	57SPK63DSROUNZVJLOC6YCGEV7NUMN3T	BCSC
188	bcsc/3r4vzr2leyx6n2irvttntqvjs3al67yp	BCREG2 William	SIX	\N	f07e7a28-39dc-4a84-b9c9-6bf40a398c96	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2021-04-08 18:23:55.467608+00	\N	3R4VZR2LEYX6N2IRVTTNTQVJS3AL67YP	BCSC
468	idir\\rarmitag	Richard	Armitage	\N	17bee496-6846-4bf1-acea-c52625be92b6	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-11-03 19:54:11.152936+00	\N	AE74F2E2DD474F55A31075EF8FA393B3	IDIR
469	idir\\ddenis	Darci	Denis	\N	f0c355da-0f83-4241-9a40-a8a6cab93790	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-11-18 22:32:16.199656+00	\N	5CBD7C86D1E14989BE8007BFF91A2654	IDIR
470	idir\\tlebedov	Tracey	Lebedovich	\N	479237f0-2102-44d0-aa7d-979c62004fab	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-11-21 23:16:27.925758+00	\N	0190F99C79EA4343A051DEAAFEA8C29C	IDIR
295	idir\\jamlane	John	Lane	\N	fab20f01-f815-4fe5-b233-83cb35f6e620	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-05-18 20:46:38.944135+00	\N	CCEF705332D04F61933CAC83931A57A8	IDIR
296	idir\\schen	Steven	Chen	\N	bf4934ef-ddc9-4a6d-bd3a-27d87de5b57a	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-05-18 21:49:02.990248+00	\N	82A09D7B5963468A8056BFD4AD5ABD84	IDIR
297	bcsc/vpq3pof7lzvfsg3isk7u3i7g7lyteraj	BCREG2 Idella	NINETEEN	\N	a0281c8e-f034-4ded-9137-aaaf300c72bf	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-05-24 21:10:31.163943+00	\N	VPQ3POF7LZVFSG3ISK7U3I7G7LYTERAJ	BCSC
298	bcsc/tzxq5o6i5hfmi4hamvvrowt4uzmk5gk4	BCREG2 Darnell	SIXTEEN	\N	de2cb78e-c01c-47e5-bdab-36b755e1149a	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-05-25 06:47:15.134552+00	\N	TZXQ5O6I5HFMI4HAMVVROWT4UZMK5GK4	BCSC
299	idir\\fshabeeb	Faiz	Shabeeb	\N	dd76ddae-a862-43cc-b7c0-55779de15b7f	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-05-31 16:50:40.617679+00	\N	5D33C0006B3947E49AF0876BC14C4213	IDIR
300	idir\\rpaliwal	Ritvick	Paliwal	\N	a5bcfc8c-78f4-4e67-b734-d2dc75829035	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-05-31 22:54:54.471407+00	\N	0A9FDB58FCB04A53B997DF32B0ED8B6A	IDIR
301	idir\\allamber	Alex	Lambert	\N	7f25e1ef-2dbf-44d2-9f43-f257e6a81a17	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-06-01 21:02:11.723664+00	\N	2939FBE685834E70A4C9E1160A8FEFAA	IDIR
302	idir\\midinu	Mihai	Dinu	\N	61401386-5338-460d-a974-0cfcaf16f74f	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-06-21 06:38:36.361859+00	\N	0DF3FD82B9074B239347BA5A0E70D9DD	IDIR
303	bcsc/ohc6l3mtx6rwnf3l7c7y2tz5tcogmzlz	PETER BEN	PAKER	\N	b7923984-efe6-479e-84a5-398af9e89740	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-07-11 22:58:46.059927+00	\N	OHC6L3MTX6RWNF3L7C7Y2TZ5TCOGMZLZ	BCSC
304	idir\\zbroitma	Zac	Broitman	\N	4a52e460-5096-44bc-932b-ce419f02368a	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-07-25 19:49:01.047867+00	\N	E9BEC9F0D01745399F182C158776F624	IDIR
305	idir\\selzinga	Sarah	Elzinga	\N	c7e0f657-e8bc-44f9-9989-aa2faf4671c2	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-07-26 20:45:10.666093+00	\N	53D21DB48A5E4E348D1335BFFE6286AF	IDIR
306	bcsc/emjw4d4qwpyt2pxtabpplrlxgw2dlkra	BCREGTEST KAHLIL	ONEHUNDREDTHIRTEEN	\N	ce624f86-fdd0-4e2e-91d6-61ab70383f81	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-07-27 19:54:36.946049+00	\N	EMJW4D4QWPYT2PXTABPPLRLXGW2DLKRA	BCSC
308	idir\\brtest1	Business	Registry Test 1	\N	cfe82f35-bb7e-4308-bf28-5e585690b987	https://test.oidc.gov.bc.ca/auth/realms/fcf0kpqr	2022-08-04 18:43:09.963663+00	\N	05E5CE5FF6564D2490A685279C179655	IDIR
\.


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 206
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user5SJ
--

SELECT pg_catalog.setval('public.users_id_seq', 495, true);


--
-- TOC entry 2835 (class 2606 OID 409703)
-- Name: users users_idp_userid_key; Type: CONSTRAINT; Schema: public; Owner: user5SJ
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_idp_userid_key UNIQUE (idp_userid);


--
-- TOC entry 2837 (class 2606 OID 16423)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user5SJ
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 16425)
-- Name: users users_sub_key; Type: CONSTRAINT; Schema: public; Owner: user5SJ
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_sub_key UNIQUE (sub);


--
-- TOC entry 2832 (class 1259 OID 442786)
-- Name: ix_user_idp_userid; Type: INDEX; Schema: public; Owner: user5SJ
--

CREATE UNIQUE INDEX ix_user_idp_userid ON public.users USING btree (idp_userid);


--
-- TOC entry 2833 (class 1259 OID 442785)
-- Name: ix_users_username; Type: INDEX; Schema: public; Owner: user5SJ
--

CREATE INDEX ix_users_username ON public.users USING btree (username);


-- Completed on 2023-03-24 19:20:06 PDT

--
-- PostgreSQL database dump complete
--
