--
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: dvdstore; Owner: postgres
--

CREATE SEQUENCE dvdstore.staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dvdstore.staff_staff_id_seq OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: dvdstore; Owner: postgres
--

CREATE TABLE dvdstore.staff (
    staff_id integer DEFAULT nextval('dvdstore.staff_staff_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id smallint NOT NULL,
    email character varying(50),
    store_id smallint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    username character varying(16) NOT NULL,
    password character varying(40),
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    picture bytea
);


ALTER TABLE dvdstore.staff OWNER TO postgres;
