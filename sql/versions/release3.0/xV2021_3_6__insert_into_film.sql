--
-- Data for Name: film; Type: TABLE DATA; Schema: film; Owner: postgres
--

--COPY film.film (film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext) FROM stdin;
----\.
COPY film.film (film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext) FROM '/flyway/sql/data/film_film.dat';

--
-- Data for Name: actor; Type: TABLE DATA; Schema: film; Owner: postgres
--

--COPY film.actor (actor_id, film_id, last_update) FROM stdin;
--\.
COPY film.film_actor (film_actor_id, film_id, last_update) FROM '/flyway/sql/data/film_actor.dat';

--
-- Data for Name: film_category; Type: TABLE DATA; Schema: film; Owner: postgres
--

--COPY film.film_category (film_id, category_id, last_update) FROM stdin;
--\.
COPY film.film_category (film_id, category_id, last_update) FROM '/flyway/sql/data/film_category.dat';