insert into charity_donation.roles (name) value ('ROLE_USER');
insert into charity_donation.roles (name) value ('ROLE_ADMIN');

insert into charity_donation.users (email, enabled, first_name, last_name, password, role_id) VALUES ('jan@kowalski.pl', 1, 'Jan', 'Kowalski', '$2a$12$aQ95vY7DFoQif0/h8dQX4.NPiWBDswcCw5cm0pNOp31gLanzinwaq', 1);


insert into charity_donation.categories (name) values ('ubrania');
insert into charity_donation.categories (name) values ('zabawki');
insert into charity_donation.categories (name) values ('dania instant');
insert into charity_donation.categories (name) values ('makarony');

insert into charity_donation.institutions (name, description) values ('Bez domu', 'Cel i misja: Pomoc dla osób nie posiadających miejsca zamieszkania.');
insert into charity_donation.institutions (name, description) values ('A kogo', 'Cel i misja: Pomoc wybudzaniu dzieci ze śpiączki.');
insert into charity_donation.institutions (name, description) values ('Dla dzieci', 'Cel i misja: Pomoc osobom znajdującym się w trudnej sytuacji życiowej.');
insert into charity_donation.institutions (name, description) values ('Dbam o zdrowie', 'Cel i misja: Pomoc dzieciom z ubogich rodzin');

insert into charity_donation.donations (quantity, institution_id, street, city, zip_code, pick_up_date, pick_up_time, pick_up_comment) values (2, 1, 'Główna 5', 'Warszawa', '01-001', CURRENT_DATE, CURRENT_TIME, 'istotny komentarz');
insert into charity_donation.donations (quantity, institution_id, street, city, zip_code, pick_up_date, pick_up_time, pick_up_comment) values (1, 2, 'Główna 6', 'Warszawa', '01-001', CURRENT_DATE, CURRENT_TIME, 'istotny komentarz');

insert into charity_donation.donations_categories (donation_id, category_id) values (1, 1);
insert into charity_donation.donations_categories (donation_id, category_id) values (1, 2);
insert into charity_donation.donations_categories (donation_id, category_id) values (2, 3);
