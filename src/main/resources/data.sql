insert into charity_donation.roles (name) value ('ROLE_USER');
insert into charity_donation.roles (name) value ('ROLE_ADMIN');

insert into charity_donation.users (email, enabled, first_name, last_name, password) VALUES ('jan@kowalski.pl', true, 'Jan', 'Kowalski', '$2a$12$aQ95vY7DFoQif0/h8dQX4.NPiWBDswcCw5cm0pNOp31gLanzinwaq');
insert into charity_donation.users (email, enabled, first_name, last_name, password) VALUES ('grzegorz@brzeczyszczykiewicz.pl', true, 'Grzegorz', 'Brzeczyszczykiewicz', '$2a$12$aQ95vY7DFoQif0/h8dQX4.NPiWBDswcCw5cm0pNOp31gLanzinwaq');

insert into charity_donation.user_role(user_id, role_id) VALUES (1,1);
insert into charity_donation.user_role(user_id, role_id) VALUES (2,2);

insert into charity_donation.categories (name) values ('ubrania');
insert into charity_donation.categories (name) values ('zabawki');
insert into charity_donation.categories (name) values ('dania instant');
insert into charity_donation.categories (name) values ('makarony');

insert into charity_donation.institutions (name, description, active) values ('Bez domu', 'Cel i misja: Pomoc dla osób nie posiadających miejsca zamieszkania.', true);
insert into charity_donation.institutions (name, description, active) values ('A kogo', 'Cel i misja: Pomoc wybudzaniu dzieci ze śpiączki.', true);
insert into charity_donation.institutions (name, description, active) values ('Dla dzieci', 'Cel i misja: Pomoc osobom znajdującym się w trudnej sytuacji życiowej.', true);
insert into charity_donation.institutions (name, description, active) values ('Dbam o zdrowie', 'Cel i misja: Pomoc dzieciom z ubogich rodzin', true);

insert into charity_donation.donations (quantity, institution_id, street, city, zip_code, pick_up_date, pick_up_time, pick_up_comment, status, donator_id, registered) values (2, 1, 'Główna 5', 'Warszawa', '01-001', '2022-06-08', '10:00:00', 'istotny komentarz', 'nieodebrane', 1, '2022:06:05');
insert into charity_donation.donations (quantity, institution_id, street, city, zip_code, pick_up_date, pick_up_time, pick_up_comment, status, donator_id, picked_up, registered) values (1, 2, 'Główna 6', 'Warszawa', '01-001', '2022-06-02', '11:30:00', 'istotny komentarz', 'odebrane', 1, '2022-06-02', '2022-05-20');

insert into charity_donation.donations_categories (donation_id, category_id) values (1, 1);
insert into charity_donation.donations_categories (donation_id, category_id) values (1, 2);
insert into charity_donation.donations_categories (donation_id, category_id) values (2, 3);
