--
-- Name: group_concat(text); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE public.group_concat(text) (
    SFUNC = public.group_concat,
    STYPE = text
);


ALTER AGGREGATE public.group_concat(text) OWNER TO postgres;