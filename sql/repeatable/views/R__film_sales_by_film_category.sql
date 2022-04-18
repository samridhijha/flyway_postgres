--
-- Name: sales_by_film_category; Type: VIEW; Schema: film; Owner: postgres
--
CREATE OR REPLACE VIEW film.sales_by_film_category AS
 SELECT c.name AS category,
    sum(p.amount) AS total_sales
   FROM (((((film.payment p
     JOIN film.rental r ON ((p.rental_id = r.rental_id)))
     JOIN film.inventory i ON ((r.inventory_id = i.inventory_id)))
     JOIN film.film f ON ((i.film_id = f.film_id)))
     JOIN film.film_category fc ON ((f.film_id = fc.film_id)))
     JOIN film.category c ON ((fc.category_id = c.category_id)))
  GROUP BY c.name
  ORDER BY (sum(p.amount)) DESC;


ALTER TABLE film.sales_by_film_category OWNER TO postgres;
