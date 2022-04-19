COPY customer.customer(customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date ,last_update, active)
FROM '/flyway/sql/versions/release2.0/customer.dat'
WITH DELIMITER E'\t';