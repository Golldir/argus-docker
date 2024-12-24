--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)

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
-- Name: mnemonicschemes; Type: TABLE; Schema: public; Owner: argus
--

CREATE TABLE public.mnemonicschemes (
    id integer NOT NULL,
    image character varying,
    slug character varying,
    navmenu_name character varying,
    server_id integer
);


ALTER TABLE public.mnemonicschemes OWNER TO argus;

--
-- Name: mnemonicschemes_id_seq; Type: SEQUENCE; Schema: public; Owner: argus
--

CREATE SEQUENCE public.mnemonicschemes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mnemonicschemes_id_seq OWNER TO argus;

--
-- Name: mnemonicschemes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: argus
--

ALTER SEQUENCE public.mnemonicschemes_id_seq OWNED BY public.mnemonicschemes.id;


--
-- Name: sensors; Type: TABLE; Schema: public; Owner: argus
--

CREATE TABLE public.sensors (
    id integer NOT NULL,
    code character varying,
    pos_x character varying,
    pos_y character varying,
    color character varying,
    units character varying,
    current_value character varying,
    center boolean,
    line_breaks boolean,
    scheme_slug character varying
);


ALTER TABLE public.sensors OWNER TO argus;

--
-- Name: sensors_id_seq; Type: SEQUENCE; Schema: public; Owner: argus
--

CREATE SEQUENCE public.sensors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sensors_id_seq OWNER TO argus;

--
-- Name: sensors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: argus
--

ALTER SEQUENCE public.sensors_id_seq OWNED BY public.sensors.id;


--
-- Name: smbservers; Type: TABLE; Schema: public; Owner: argus
--

CREATE TABLE public.smbservers (
    id integer NOT NULL,
    server_ip character varying,
    server_name character varying,
    shared_folder_name character varying,
    file_name character varying,
    server_availability boolean
);


ALTER TABLE public.smbservers OWNER TO argus;

--
-- Name: smbservers_id_seq; Type: SEQUENCE; Schema: public; Owner: argus
--

CREATE SEQUENCE public.smbservers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.smbservers_id_seq OWNER TO argus;

--
-- Name: smbservers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: argus
--

ALTER SEQUENCE public.smbservers_id_seq OWNED BY public.smbservers.id;


--
-- Name: mnemonicschemes id; Type: DEFAULT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.mnemonicschemes ALTER COLUMN id SET DEFAULT nextval('public.mnemonicschemes_id_seq'::regclass);


--
-- Name: sensors id; Type: DEFAULT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.sensors ALTER COLUMN id SET DEFAULT nextval('public.sensors_id_seq'::regclass);


--
-- Name: smbservers id; Type: DEFAULT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.smbservers ALTER COLUMN id SET DEFAULT nextval('public.smbservers_id_seq'::regclass);


--
-- Data for Name: mnemonicschemes; Type: TABLE DATA; Schema: public; Owner: argus
--

COPY public.mnemonicschemes (id, image, slug, navmenu_name, server_id) FROM stdin;
3	kond.png	kond	Конденсация	1
6	nas3.png	nas3	Насосная №3	3
5	nas2.png	nas2	Насосная №2	3
1	mash.png	mash	Машзал ГДМ	4
2	grad.png	grad	Градирни	3
4	nas1.png	nas1	Насосная №1	2
\.


--
-- Data for Name: sensors; Type: TABLE DATA; Schema: public; Owner: argus
--

COPY public.sensors (id, code, pos_x, pos_y, color, units, current_value, center, line_breaks, scheme_slug) FROM stdin;
132	mash204807	72.89	35.50	lime	'C	74.03	t	f	mash
118	mash203207	6.73	35.50	lime	'C	22.93	t	f	mash
123	mash204005	46.04	35.50	lime	'C	41.31	t	f	mash
126	mash204801	94.3	44.4	lime	'C	52.45	t	t	mash
116	mash203205	12.96	35.50	lime	'C	53.85	t	f	mash
113	mash203202	17.8	46.08	lime	'C	22.2	f	f	mash
134	mash205602	17.8	78.29	lime	'C	16.83	f	f	mash
127	mash204802	83.95	46.08	lime	'C	17.45	f	f	mash
120	mash204002	50.8	46.08	lime	'C	93.11	f	f	mash
146	mash205608	0.56	71.00	silver	A	59.57	t	f	mash
112	mash203201	28.30	44.4	lime	'C	54.48	t	t	mash
91	mash200801	28.30	12.00	lime	'C	37.54	t	t	mash
92	mash200802	17.8	13.87	lime	'C	70.3	f	f	mash
94	mash200804	12.96	27.29	lime	'C	91.23	t	f	mash
95	mash200805	12.96	3.13	lime	'C	59.18	t	f	mash
96	mash200806	6.73	27.29	lime	'C	35.85	t	f	mash
97	mash200807	6.73	3.13	lime	'C	48.37	t	f	mash
101	mash201604	46.04	27.29	lime	'C	14.13	t	f	mash
102	mash201605	46.04	3.13	lime	'C	13.13	t	f	mash
103	mash201606	39.81	27.29	lime	'C	71.69	t	f	mash
104	mash201607	39.81	3.13	lime	'C	44.69	t	f	mash
108	mash202404	79.12	27.29	lime	'C	57.87	t	f	mash
109	mash202405	79.12	3.13	lime	'C	93.43	t	f	mash
110	mash202406	72.89	27.29	lime	'C	93.86	t	f	mash
111	mash202407	72.89	3.13	lime	'C	37.96	t	f	mash
115	mash203204	12.96	59.5	lime	'C	90.68	t	f	mash
117	mash203206	6.73	59.5	lime	'C	73.32	t	f	mash
122	mash204004	46.04	59.5	lime	'C	79.44	t	f	mash
124	mash204006	39.81	59.5	lime	'C	17.12	t	f	mash
129	mash204804	79.12	59.5	lime	'C	11.69	t	f	mash
131	mash204806	72.89	59.5	lime	'C	65.55	t	f	mash
136	mash205604	12.96	91.72	lime	'C	3.58	t	f	mash
137	mash205605	12.96	67.55	lime	'C	22.36	t	f	mash
138	mash205606	6.73	91.72	lime	'C	34.13	t	f	mash
139	mash205607	6.73	67.55	lime	'C	-3.76	t	f	mash
140	mash200808	0.56	6.31	silver	A	27.68	t	f	mash
142	mash202408	66.61	6.31	silver	A	18.42	t	f	mash
143	mash203208	0.56	38.58	silver	A	60.56	t	f	mash
145	mash204808	66.61	38.58	silver	A	17.3	t	f	mash
147	mash206401	0.56	14.61	silver	мм/с	57.52	t	t	mash
149	mash206403	66.61	14.61	silver	мм/с	57.72	t	t	mash
150	mash206404	0.56	46.82	silver	мм/с	30.13	t	t	mash
152	mash206406	66.61	46.82	silver	мм/с	58.07	t	t	mash
153	mash206407	0.56	79.04	silver	мм/с	81.62	t	t	mash
154	mash207201	19.2	6.31	red	мм	86.54	t	f	mash
155	mash207202	52.27	6.31	red	мм	63.15	t	f	mash
156	mash207203	85.35	6.31	red	мм	56.3	t	f	mash
157	mash207204	19.2	38.58	red	мм	89.89	t	f	mash
158	mash207205	52.27	38.58	red	мм	70.19	t	f	mash
159	mash207206	85.35	38.58	red	мм	65.23	t	f	mash
160	mash207207	19.2	70.64	red	мм	8.18	t	f	mash
161	mash208001	27.8	29.3	red	мм	65.77	f	f	mash
162	mash208002	60.88	29.3	red	мм	11.43	f	f	mash
163	mash208003	93.76	29.3	red	мм	28.74	f	f	mash
164	mash208004	27.8	61.52	red	мм	-3.98	f	f	mash
165	mash208005	60.88	61.52	red	мм	96.95	f	f	mash
166	mash208006	93.86	61.52	red	мм	35.9	f	f	mash
167	mash208007	27.8	93.73	red	мм	48.18	f	f	mash
168	mash208801	45.0	67.46	red	мм	92.18	f	f	mash
169	mash208802	45.0	69.57	red	мм	51.52	f	f	mash
170	mash209601	19.2	7.9	orange	%	60.37	t	f	mash
171	mash209602	52.27	7.9	orange	%	1.84	t	f	mash
172	mash209603	85.35	7.9	orange	%	86.48	t	f	mash
173	mash209604	19.2	40.11	orange	%	47.55	t	f	mash
174	mash209605	52.27	40.11	orange	%	99.85	t	f	mash
175	mash209606	85.35	40.11	orange	%	56.54	t	f	mash
176	mash209607	19.2	72.33	orange	%	2.54	t	f	mash
177	mash208807	45.0	73.5	yellow	%	87.73	f	f	mash
178	mash208808	45.0	75.51	yellow	%	76.29	f	f	mash
133	mash205601	28.30	76.80	lime	'C	54.75	t	t	mash
98	mash201601	61.15	12.00	lime	'C	60.3	t	t	mash
99	mash201602	50.8	13.87	lime	'C	84.98	f	f	mash
105	mash202401	94.3	12.00	lime	'C	48.94	t	t	mash
119	mash204001	61.15	44.4	lime	'C	61.06	t	t	mash
106	mash202402	83.95	13.87	lime	'C	93.96	f	f	mash
128	mash204803	85.35	59.5	lime	'C	51.99	t	t	mash
114	mash203203	19.2	59.5	lime	'C	74.65	t	t	mash
100	mash201603	52.27	27.29	lime	'C	43.62	t	t	mash
148	mash206402	33.50	14.61	silver	мм/с	58.01	t	t	mash
141	mash201608	33.50	6.31	silver	A	2.92	t	f	mash
151	mash206405	33.50	46.82	silver	мм/с	39.12	t	t	mash
144	mash204008	33.50	38.58	silver	A	1.87	t	f	mash
107	mash202403	85.35	27.29	lime	'C	19.3	t	t	mash
135	mash205603	19.2	91.72	lime	'C	61.89	t	t	mash
121	mash204003	52.27	59.5	lime	'C	79.11	t	t	mash
93	mash200803	19.2	27.29	lime	'C	30.32	t	t	mash
125	mash204007	39.81	35.50	lime	'C	52.09	t	f	mash
184	204006	37.40	27.77	lime	'C	17.07	t	f	grad
179	204001	14.10	27.77	lime	'C	23.18	t	f	grad
180	204002	14.10	43.51	lime	'C	32.09	t	f	grad
181	204003	14.10	59.24	lime	'C	56.36	t	f	grad
182	204004	14.10	74.98	lime	'C	28.42	t	f	grad
183	204005	14.10	90.71	lime	'C	9.41	t	f	grad
198	211201	2.500	3.170	lime	'C	9.6	t	f	grad
185	204007	37.40	43.51	lime	'C	-4.89	t	f	grad
186	204008	37.40	59.24	lime	'C	12.6	t	f	grad
187	204801	37.40	74.98	lime	'C	77.95	t	f	grad
188	204802	37.40	90.71	lime	'C	37.74	t	f	grad
189	204803	63.60	27.77	lime	'C	39.04	t	f	grad
190	204804	63.60	43.51	lime	'C	14.27	t	f	grad
191	204805	63.60	59.24	lime	'C	90.67	t	f	grad
192	204806	63.60	74.98	lime	'C	48.76	t	f	grad
193	204807	87.90	28.17	lime	'C	1.17	t	f	grad
194	204808	87.90	43.51	lime	'C	44.65	t	f	grad
195	205601	85	59.24	lime	'C	36.88	t	f	grad
196	205602	85	74.98	lime	'C	9.02	t	f	grad
197	205603	85	90.61	lime	'C	0.31	t	f	grad
199	211202	2.500	14.00	lime	'C	56.5	t	t	grad
200	211203	90.00	14	lime	'C	75.98	t	f	grad
201	205604	14.10	16.97	silver	A	19.07	t	f	grad
202	205605	14.10	32.70	silver	A	53.39	t	f	grad
203	205606	14.10	48.44	silver	A	-3.85	t	f	grad
204	205607	14.10	64.17	silver	A	94.12	t	f	grad
205	205608	14.10	79.91	silver	A	57.61	t	f	grad
206	206401	37.40	16.97	silver	A	88.61	t	f	grad
207	206402	37.40	32.70	silver	A	99.02	t	f	grad
208	206403	37.40	48.44	silver	A	-3.75	t	f	grad
209	206404	37.40	64.17	silver	A	55.28	t	f	grad
210	206405	37.40	79.91	silver	A	1.83	t	f	grad
211	206406	63.60	16.97	silver	A	73.0	t	f	grad
212	206407	63.60	32.70	silver	A	39.81	t	f	grad
213	206408	63.60	48.44	silver	A	82.97	t	f	grad
214	210401	63.60	64.17	silver	A	82.68	t	f	grad
215	210402	87.90	17.27	silver	A	34.24	t	f	grad
216	210403	87.90	32.70	silver	A	98.67	t	f	grad
217	210404	85	48.44	silver	A	82.46	t	f	grad
218	210406	85	79.91	silver	A	74.43	t	f	grad
219	210407	85	64.17	silver	A	20.31	t	f	grad
220	211205	2.50	5.08	red	кгс/см2	38.78	t	f	grad
221	211206	2.50	19	red	кгс/см2	31.42	t	t	grad
222	211207	81.50	14	red	кгс/см2	40.75	f	t	grad
311	naso200101	34.41	37.28	lime	'C	26.79	t	f	nas1
318	naso200107	15.0	31.56	red	кгс/см2	-1.38	f	f	nas1
319	naso200108	15.0	17.27	red	кгс/см2	63.76	f	f	nas1
323	naso200112	5.44	76	red	кгс/см2	29.61	t	t	nas1
324	naso200113	4.44	8.95	red	кгс/см2	55.71	f	f	nas1
320	true	34.41	35.39	red	кгс/см2	71.42	t	f	nas1
321	naso200110	34.41	49.88	red	кгс/см2	16.74	t	f	nas1
322	naso200111	46.14	61.21	red	кгс/см2	11.18	f	f	nas1
326	naso200114	74.54	76.22	yellow	%	7.11	t	f	nas1
327	naso200115	89.43	76.22	yellow	%	24.77	t	f	nas1
312	naso200102	34.41	51.77	lime	'C	28.94	t	f	nas1
313	naso200103	46.14	63.2	lime	'C	38.34	f	f	nas1
314	naso200104	4.44	10.66	lime	'C	34.02	f	f	nas1
316	naso200105	15.0	60.02	red	кгс/см2	85.11	f	f	nas1
317	naso200106	15.0	45.84	red	кгс/см2	77.38	f	f	nas1
369	212803	10.5	79.0	cyan	Тм3/ч	-2.5	f	f	nas2
364	212005	59	28.8	red	кгс/см2	6.17	t	t	nas2
366	212807	10.5	75.6	red	кгс/см2	58.27	f	f	nas2
367	212008	21.8	75.6	red	кгс/см2	78.92	f	f	nas2
328	207201	13.5	46.0	lime	'C	-2.51	t	f	nas2
329	207202	13.5	47.91	lime	'C	94.9	t	f	nas2
330	207203	25	46.0	lime	'C	21.17	t	f	nas2
331	207204	25	47.91	lime	'C	40.19	t	f	nas2
332	207205	36	46.0	lime	'C	73.37	t	f	nas2
333	207206	36	47.91	lime	'C	20.3	t	f	nas2
334	207207	47.5	46.0	lime	'C	10.6	t	f	nas2
335	207208	47.5	47.91	lime	'C	89.6	t	f	nas2
336	208001	59	46.0	lime	'C	37.29	t	f	nas2
337	208002	59	47.91	lime	'C	28.4	t	f	nas2
338	208003	69	46.0	lime	'C	42.43	t	f	nas2
339	208004	69	47.91	lime	'C	94.56	t	f	nas2
340	208005	13.5	34.82	lime	'C	81.29	t	f	nas2
341	208006	13.5	36.74	lime	'C	59.88	t	f	nas2
342	208007	25	34.82	lime	'C	32.64	t	f	nas2
343	208008	25	36.74	lime	'C	22.41	t	f	nas2
344	208801	36	34.82	lime	'C	8.57	t	f	nas2
345	208802	36	36.74	lime	'C	1.14	t	f	nas2
346	208803	47.5	34.82	lime	'C	63.19	t	f	nas2
347	208804	47.5	36.74	lime	'C	80.72	t	f	nas2
348	208805	59	34.82	lime	'C	49.36	t	f	nas2
349	208806	59	36.74	lime	'C	71.13	t	f	nas2
350	208807	69	34.82	lime	'C	89.94	t	f	nas2
351	200809999	69	36.74	lime	'C	42.52	t	f	nas2
352	212801	10.5	77.21	lime	'C	42.85	f	f	nas2
353	212802	21.8	77.21	lime	'C	59.55	f	f	nas2
354	209601	13.5	32.91	silver	A	49.64	t	f	nas2
355	209602	25	32.91	silver	A	11.95	t	f	nas2
356	209603	36	32.91	silver	A	73.64	t	f	nas2
357	209604	47.5	32.91	silver	A	97.73	t	f	nas2
365	212006	69	28.8	red	кгс/см2	96.28	t	t	nas2
358	209605	59	32.91	silver	A	-2.22	t	f	nas2
359	209606	69	32.91	silver	A	5.01	t	f	nas2
368	201604	78.0	13.94	red	кг/см2	25.24	f	f	nas2
362	212003	36	28.8	red	кгс/см2	45.78	t	t	nas2
370	212804	21.8	79.0	cyan	Тм3/ч	46.72	f	f	nas2
371	201602	78.0	12.04	cyan	т/ч	36.53	f	f	nas2
372	212805	46.3	77.2	yellow	м	49.5	f	f	nas2
361	212002	25	28.8	red	кгс/см2	74.22	t	t	nas2
363	212004	47.5	28.8	red	кгс/см2	85.75	t	t	nas2
360	212001	13.5	28.8	red	кгс/см2	73.66	t	t	nas2
379	200807	46.5	54.82	lime	'C	67.62	t	f	nas3
380	200808	46.5	56.74	lime	'C	0.0	t	f	nas3
382	202403	5.5	77.44	lime	'C	25.12	t	f	nas3
383	202405	34.5	52.91	silver	A	50.55	t	f	nas3
384	202406	46.5	52.91	silver	A	62.32	t	f	nas3
385	202407	61.5	57	silver	A	7.34	t	f	nas3
386	202408	74.0	57	silver	A	91.26	t	f	nas3
388	203201	34.5	72	red	кгс/см2	3.46	t	f	nas3
389	203202	46.5	72	red	кгс/см2	85.17	t	f	nas3
390	203203	61.5	54.7	red	кгс/см2	8.47	t	f	nas3
391	203204	74	54.7	red	кгс/см2	45.75	t	f	nas3
392	203205	34.5	50.24	red	кгс/см2	42.71	t	f	nas3
394	201607	88.3	40.12	cyan	Тм3/ч	51.23	t	t	nas3
395	202401	19.2	72.59	cyan	Тм3/ч	37.41	t	t	nas3
396	202402	5.5	72.59	cyan	Тм3/ч	47.5	t	t	nas3
374	200802	34.5	68.5	lime	'C	98.35	t	f	nas3
381	2008088888	44.5	90	lime	'C	0.0	f	f	nas3
373	200801	34.5	66.59	lime	'C	88.32	t	f	nas3
387	201603	44.5	92	red	кгс/см2	86.92	f	f	nas3
393	201605	44.5	94	cyan	Тм3/ч	72.73	f	f	nas3
375	200803	46.5	66.59	lime	'C	15.41	t	f	nas3
376	200804	46.5	68.5	lime	'C	65.6	t	f	nas3
377	200805	34.5	54.82	lime	'C	92.84	t	f	nas3
378	200806	34.5	56.74	lime	'C	79.12	t	f	nas3
130	mash204805	79.12	35.50	lime	'C	101.0	t	f	mash
267	kond200803	72.63	15.29	yellow	м	0.01	f	f	kond
268	kond200804	72.63	18.00	yellow	м	0.0	f	f	kond
269	kond200805	60.61	15.29	yellow	м	1.83	f	f	kond
270	kond200806	60.61	18.00	yellow	м	1.73	f	f	kond
286	kond200807	44.43	69.20	lime	'C	71.83	t	f	kond
271	kond200808	48.6	15.29	yellow	м	2.01	f	f	kond
272	kond201602	36.57	15.29	yellow	м	0.0	f	f	kond
273	kond201603	24.55	15.29	yellow	м	0.0	f	f	kond
274	kond201604	24.55	18.00	yellow	м	0.0	f	f	kond
275	kond201605	12.53	15.29	yellow	м	0.0	f	f	kond
276	kond201606	12.53	18.00	yellow	м	0.0	f	f	kond
277	kond201607	53.74	42.18	yellow	м	1.6	f	f	kond
278	kond201608	41.67	42.18	yellow	м	1.93	f	f	kond
279	kond202401	90.2	78	yellow	м	2.93	t	t	kond
280	kond202402	12.53	42.18	yellow	м	0.0	f	f	kond
281	kond202403	24.55	42.18	yellow	м	0.0	f	f	kond
282	kond202404	24.55	84.59	yellow	м	2.34	f	f	kond
283	kond202405	53.84	84.39	yellow	м	1.08	f	f	kond
289	kond202406	82.01	87.32	lime	'C	52.43	f	f	kond
307	kond202407	58.38	71.43	cyan	м3/ч	181.27	t	f	kond
284	kond202408	2.83	28.08	yellow	м	1.01	t	f	kond
303	kond203201	37.7	71.43	cyan	м3/ч	25.17	t	f	kond
309	kond203202	69.19	64.5	cyan	м3/ч	51.0	f	f	kond
310	kond203203	7.5	96.29	cyan	м3/ч	31.75	f	f	kond
308	kond203204	82.01	90.05	cyan	м3/ч	0.0	f	f	kond
301	kond204808	43.64	62.78	lime	'C	13.24	f	f	kond
305	kond203205	91.62	42.36	cyan	м3/ч	151.11	f	t	kond
304	kond203206	44.43	71.43	cyan	м3/ч	0.0	t	f	kond
306	kond203207	51.51	71.43	cyan	м3/ч	230.62	t	f	kond
302	kond203208	4.03	0.38	cyan	м3/ч	57.3	f	f	kond
291	kond204001	7.5	93.1	lime	'C	74.78	f	f	kond
287	kond204002	72.21	48.35	lime	'C	56.81	t	f	kond
288	kond204003	85.85	48.25	lime	'C	42.45	t	f	kond
292	kond204004	33	62.78	lime	'C	68.17	f	f	kond
285	kond204005	37.7	69.20	lime	'C	66.73	t	f	kond
293	kond204006	7.5	75	lime	'C	83.42	f	f	kond
290	kond204007	69.19	62.78	lime	'C	43.93	f	f	kond
294	kond204801	59.09	55.64	lime	'C	36.36	f	f	kond
295	kond204802	59.09	62.78	lime	'C	45.06	f	f	kond
296	kond204803	53.94	55.64	lime	'C	34.21	f	f	kond
297	kond204804	53.94	62.78	lime	'C	41.24	f	f	kond
298	kond204805	48.79	55.64	lime	'C	138.6	f	f	kond
299	kond204806	48.79	62.78	lime	'C	0.0	f	f	kond
300	kond204807	43.64	55.64	lime	'C	0.0	f	f	kond
\.


--
-- Data for Name: smbservers; Type: TABLE DATA; Schema: public; Owner: argus
--

COPY public.smbservers (id, server_ip, server_name, shared_folder_name, file_name, server_availability) FROM stdin;
3	192.168.0.20	CU2-NAS2	Data	AriesSvc.val	f
5	192.168.0.20	LAPTOP-PCS7	test	AriesSvc_KOND.val	t
1	192.168.0.7	CU2-KOND	Data	AriesSvc.val	f
2	192.168.0.12	CU2-NAS1	Data	AriesSvc.val	f
4	192.168.0.9	CU2-MASH	Data	AriesSvc.val	f
\.


--
-- Name: mnemonicschemes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: argus
--

SELECT pg_catalog.setval('public.mnemonicschemes_id_seq', 1, false);


--
-- Name: sensors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: argus
--

SELECT pg_catalog.setval('public.sensors_id_seq', 352, true);


--
-- Name: smbservers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: argus
--

SELECT pg_catalog.setval('public.smbservers_id_seq', 4, true);


--
-- Name: mnemonicschemes mnemonicschemes_navmenu_name_key; Type: CONSTRAINT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.mnemonicschemes
    ADD CONSTRAINT mnemonicschemes_navmenu_name_key UNIQUE (navmenu_name);


--
-- Name: mnemonicschemes mnemonicschemes_pkey; Type: CONSTRAINT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.mnemonicschemes
    ADD CONSTRAINT mnemonicschemes_pkey PRIMARY KEY (id);


--
-- Name: sensors sensors_code_key; Type: CONSTRAINT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_code_key UNIQUE (code);


--
-- Name: sensors sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (id);


--
-- Name: smbservers smbservers_pkey; Type: CONSTRAINT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.smbservers
    ADD CONSTRAINT smbservers_pkey PRIMARY KEY (id);


--
-- Name: smbservers smbservers_server_name_key; Type: CONSTRAINT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.smbservers
    ADD CONSTRAINT smbservers_server_name_key UNIQUE (server_name);


--
-- Name: ix_mnemonicschemes_slug; Type: INDEX; Schema: public; Owner: argus
--

CREATE UNIQUE INDEX ix_mnemonicschemes_slug ON public.mnemonicschemes USING btree (slug);


--
-- Name: mnemonicschemes mnemonicschemes_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.mnemonicschemes
    ADD CONSTRAINT mnemonicschemes_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.smbservers(id);


--
-- Name: sensors sensors_scheme_slug_fkey; Type: FK CONSTRAINT; Schema: public; Owner: argus
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_scheme_slug_fkey FOREIGN KEY (scheme_slug) REFERENCES public.mnemonicschemes(slug);


--
-- PostgreSQL database dump complete
--

