--
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film.actor_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE film.actor_actor_id_seq OWNER TO postgres;

--
-- Name: actor; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.actor (
    actor_id integer DEFAULT nextval('film.actor_actor_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE film.actor OWNER TO postgres;
