--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE film.category_category_id_seq OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.film_category (
    category_id integer DEFAULT nextval('film.category_category_id_seq'::regclass) NOT NULL,
    name character varying(25) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE film.film_category OWNER TO postgres;
