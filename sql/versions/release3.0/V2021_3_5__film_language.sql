--
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film.language_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE film.language_language_id_seq OWNER TO postgres;

--
-- Name: language; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.language (
    language_id integer DEFAULT nextval('film.language_language_id_seq'::regclass) NOT NULL,
    name character(20) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE film.language OWNER TO postgres;