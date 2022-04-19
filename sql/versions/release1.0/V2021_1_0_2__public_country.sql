--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: "postgres"
--

CREATE SEQUENCE IF NOT EXISTS public.country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO "postgres";

--
-- Name: country; Type: TABLE; Schema: public; Owner: "postgres"
--

CREATE TABLE IF NOT EXISTS public.country (
    country_id integer DEFAULT nextval('public.country_country_id_seq'::regclass) NOT NULL,
    country character varying(50) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.country OWNER TO "postgres";
