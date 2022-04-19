--
-- Name: film_film_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film.film_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE film.film_film_id_seq OWNER TO postgres;

--
-- Name: film; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.film (
    film_id integer DEFAULT nextval('film.film_film_id_seq'::regclass) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_year public.year,
    language_id smallint NOT NULL,
    rental_duration smallint DEFAULT 3 NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length smallint,
    category_id smallint NOT NULL,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    rating film.mpaa_rating DEFAULT 'G'::film.mpaa_rating,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    special_features text[],
    fulltext tsvector NOT NULL
);


ALTER TABLE film.film OWNER TO postgres;
