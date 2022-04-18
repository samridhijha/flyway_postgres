CREATE OR REPLACE FUNCTION public.last_updated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.last_update = CURRENT_TIMESTAMP;
    RETURN NEW;
END $$;

--
-- Name: customer last_updated; Type: TRIGGER; Schema: public; Owner: 'jenkins-db-user"'
--

CREATE TRIGGER last_updated BEFORE UPDATE ON customer.customer FOR EACH ROW EXECUTE PROCEDURE public.last_updated();
