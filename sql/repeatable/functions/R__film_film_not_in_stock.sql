--
-- Name: film_not_in_stock(integer, integer); Type: FUNCTION; Schema: film; Owner: postgres
--

CREATE FUNCTION film.film_not_in_stock(p_film_id integer, p_store_id integer, OUT p_film_count integer) RETURNS SETOF integer
    LANGUAGE sql
    AS $_$
    SELECT inventory_id
    FROM dvdstore.inventory
    WHERE film_id = $1
    AND store_id = $2
    AND NOT inventory_in_stock(inventory_id);
$_$;


ALTER FUNCTION film.film_not_in_stock(p_film_id integer, p_store_id integer, OUT p_film_count integer) OWNER TO postgres;