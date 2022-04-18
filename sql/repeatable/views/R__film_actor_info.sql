
CREATE VIEW film.actor_info AS
 SELECT a.actor_id,
    a.first_name,
    a.last_name,
    film.group_concat(DISTINCT (((c.name)::text || ': '::text) || ( SELECT film.group_concat((f.title)::text) AS group_concat
           FROM ((film.film f
             JOIN film.film_category fc_1 ON ((f.category_id = fc_1.category_id)))
             JOIN film.film_actor fa_1 ON ((f.film_id = fa_1.film_id)))
          WHERE ((fc_1.category_id = c.category_id) AND (fa_1.actor_id = a.actor_id))
          GROUP BY fa_1.actor_id))) AS film_info
   FROM (((film.actor a
     LEFT JOIN film.film_actor fa ON ((a.actor_id = fa.actor_id)))
     LEFT JOIN film.film_category fc ON ((fa.film_id = fc.film_id)))
     LEFT JOIN film.category c ON ((fc.category_id = c.category_id)))
  GROUP BY a.actor_id, a.first_name, a.last_name;


