BEGIN;
SELECT plan(4);
-- Verify all schemas exist
SELECT schemas_are(ARRAY['public', 'film', 'customer'], 'The customer schema is not correct');

-- Verify all tables exist in schemas
SELECT tables_are('customer', ARRAY['customer'], 'The customer schema is not correct');
SELECT tables_are('public', ARRAY['flyway_schema_history', 'address', 'city', 'country'], 'The public schema is not correct');
SELECT enums_are('film', ARRAY['mpaa_rating'], 'The film schema is not correct');

-- Verify views exist in schemas
SELECT views_are('customer', ARRAY['customer_list'], 'The customer view is not correct');

SELECT * FROM finish();
ROLLBACK;
