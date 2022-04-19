--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: dvdstore; Owner: postgres
--

CREATE SEQUENCE dvdstore.inventory_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dvdstore.inventory_inventory_id_seq OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: dvdstore; Owner: postgres
--

CREATE TABLE dvdstore.inventory (
    inventory_id integer DEFAULT nextval('dvdstore.inventory_inventory_id_seq'::regclass) NOT NULL,
    dvdstore_id smallint NOT NULL,
    store_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE dvdstore.inventory OWNER TO postgres;