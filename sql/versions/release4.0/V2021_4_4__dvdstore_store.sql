--
-- Name: store_store_id_seq; Type: SEQUENCE; Schema: dvdstore; Owner: postgres
--

CREATE SEQUENCE dvdstore.store_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dvdstore.store_store_id_seq OWNER TO postgres;

--
-- Name: store; Type: TABLE; Schema: dvdstore; Owner: postgres
--

CREATE TABLE dvdstore.store (
    store_id integer DEFAULT nextval('dvdstore.store_store_id_seq'::regclass) NOT NULL,
    manager_staff_id smallint NOT NULL,
    address_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE dvdstore.store OWNER TO postgres;
