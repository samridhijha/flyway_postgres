--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: dvdstore; Owner: postgres
--

CREATE SEQUENCE dvdstore.payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dvdstore.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: dvdstore; Owner: postgres
--

CREATE TABLE dvdstore.payment (
    payment_id integer DEFAULT nextval('dvdstore.payment_payment_id_seq'::regclass) NOT NULL,
    customer_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    rental_id integer NOT NULL,
    amount numeric(5,2) NOT NULL,
    payment_date timestamp without time zone NOT NULL
);


ALTER TABLE dvdstore.payment OWNER TO postgres;