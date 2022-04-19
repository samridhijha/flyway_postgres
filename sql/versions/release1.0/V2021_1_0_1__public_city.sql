--
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: "postgres"
--
CREATE SEQUENCE IF NOT EXISTS public.city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_city_id_seq OWNER TO "postgres";

--
-- Name: city; Type: TABLE; Schema: public; Owner: "postgres"
--

CREATE TABLE IF NOT EXISTS public.city (
    city_id integer DEFAULT nextval('public.city_city_id_seq'::regclass) NOT NULL,
    city character varying(50) NOT NULL,
    country_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.city OWNER TO "postgres";

