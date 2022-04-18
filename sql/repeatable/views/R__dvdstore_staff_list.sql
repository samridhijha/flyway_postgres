--
-- Name: staff_list; Type: VIEW; Schema: dvdstore; Owner: postgres
--

CREATE OR REPLACE VIEW dvdstore.staff_list AS
 SELECT s.staff_id AS id,
    (((s.first_name)::text || ' '::text) || (s.last_name)::text) AS name,
    a.address,
    a.postal_code AS "zip code",
    a.phone,
    city.city,
    country.country,
    s.store_id AS sid
   FROM (((dvdstore.staff s
     JOIN public.address a ON ((s.address_id = a.address_id)))
     JOIN public.city ON ((a.city_id = city.city_id)))
     JOIN public.country ON ((city.country_id = country.country_id)));


ALTER TABLE dvdstore.staff_list OWNER TO postgres;