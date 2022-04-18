--
-- Name: sales_by_store; Type: VIEW; Schema: dvdstore; Owner: postgres
--

CREATE OR REPLACE VIEW dvdstore.sales_by_store AS
 SELECT (((c.city)::text || ','::text) || (cy.country)::text) AS store,
    (((m.first_name)::text || ' '::text) || (m.last_name)::text) AS manager,
    sum(p.amount) AS total_sales
   FROM (((((((dvdstore.payment p
     JOIN dvdstore.rental r ON ((p.rental_id = r.rental_id)))
     JOIN dvdstore.inventory i ON ((r.inventory_id = i.inventory_id)))
     JOIN dvdstore.store s ON ((i.store_id = s.store_id)))
     JOIN public.address a ON ((s.address_id = a.address_id)))
     JOIN public.city c ON ((a.city_id = c.city_id)))
     JOIN public.country cy ON ((c.country_id = cy.country_id)))
     JOIN dvdstore.staff m ON ((s.manager_staff_id = m.staff_id)))
  GROUP BY cy.country, c.city, s.store_id, m.first_name, m.last_name
  ORDER BY cy.country, c.city;


ALTER TABLE dvdstore.sales_by_store OWNER TO postgres;
