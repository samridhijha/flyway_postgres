--
-- Name: film_actor; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.film_actor (
    actor_id smallint NOT NULL,
    film_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE film.film_actor OWNER TO postgres;