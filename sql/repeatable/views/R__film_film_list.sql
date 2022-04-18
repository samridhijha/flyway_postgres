--
-- Name: film_list; Type: VIEW; Schema: film; Owner: postgres
--

CREATE OR REPLACE VIEW film.film_list AS
 SELECT film.film_id AS fid,
    film.title,
    film.description,
    category.name AS category,
    film.rental_rate AS price,
    film.length,
    film.rating,
    film.group_concat((((actor.first_name)::text || ' '::text) || (actor.last_name)::text)) AS actors
   FROM ((((film.category
     LEFT JOIN film.film_category ON ((category.category_id = film_category.category_id)))
     LEFT JOIN film.film ON ((film_category.film_id = film.film_id)))
     JOIN film.film_actor ON ((film.film_id = film_actor.film_id)))
     JOIN film.actor ON ((film_actor.actor_id = actor.actor_id)))
  GROUP BY film.film_id, film.title, film.description, category.name, film.rental_rate, film.length, film.rating;


ALTER TABLE film.film_list OWNER TO postgres;
