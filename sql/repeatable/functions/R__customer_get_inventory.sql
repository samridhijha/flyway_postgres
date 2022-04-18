--
-- Name: inventory_held_by_customer(integer); Type: FUNCTION; Schema: customer; Owner: postgres
--

CREATE OR REPLACE FUNCTION customer.inventory_held_by_customer(p_inventory_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_customer_id INTEGER;
BEGIN

  SELECT customer_id INTO v_customer_id
  FROM rental
  WHERE return_date IS NULL
  AND inventory_id = p_inventory_id;

  RETURN v_customer_id;
END $$;


ALTER FUNCTION customer.inventory_held_by_customer(p_inventory_id integer) OWNER TO postgres;