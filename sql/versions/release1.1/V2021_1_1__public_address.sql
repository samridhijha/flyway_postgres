--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: "postgres"
--

CREATE SEQUENCE IF NOT EXISTS public.address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO "postgres";

--
-- Name: address; Type: TABLE; Schema: public; Owner: "postgres"
--

CREATE TABLE IF NOT EXISTS public.address (
    address_id integer DEFAULT nextval('public.address_address_id_seq'::regclass) NOT NULL,
    address character varying(25) NOT NULL,
    address2 character varying(20) NOT NULL,
    district character varying(20) NOT NULL,
    city_id smallint NOT NULL,
    phone character varying(20) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.address OWNER TO "postgres";
