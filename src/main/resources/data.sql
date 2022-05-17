insert into charity_donation.categories (name) values ('ubrania');
insert into charity_donation.categories (name) values ('zabawki');
insert into charity_donation.categories (name) values ('dania instant');
insert into charity_donation.categories (name) values ('makarony');

insert into charity_donation.institutions (name, description) values ('Fundacja "Bez domu"', 'Cel i misja: Pomoc dla osób nie posiadających miejsca zamieszkania');

insert into charity_donation.donations (quantity, institution_id, street, city, zip_code, pick_up_date, pick_up_time, pick_up_comment) values (2, 1, 'Główna 5', 'Warszawa', '01-001', CURRENT_DATE, CURRENT_TIME, 'istotny komentarz');

insert into charity_donation.donations_categories (donation_id, category_id) values (1, 1);
insert into charity_donation.donations_categories (donation_id, category_id) values (1, 2);