--
-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: dvdstore; Owner: postgres
--

CREATE SEQUENCE dvdstore.rental_rental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dvdstore.rental_rental_id_seq OWNER TO postgres;

--
-- Name: rental; Type: TABLE; Schema: dvdstore; Owner: postgres
--

CREATE TABLE dvdstore.rental (
    rental_id integer DEFAULT nextval('dvdstore.rental_rental_id_seq'::regclass) NOT NULL,
    rental_date timestamp without time zone NOT NULL,
    inventory_id integer NOT NULL,
    customer_id smallint NOT NULL,
    return_date timestamp without time zone,
    staff_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE dvdstore.rental OWNER TO postgres;