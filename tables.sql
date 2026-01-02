create database if not exists food_app;
use food_app;


-- create tables
start transaction;

create table if not exists users (
	id int auto_increment,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	email varchar(50) unique not null,
	mob varchar(10),
	address_street_no varchar(20),
	address_street_name varchar(20),
	address_city varchar(30),
	address_state varchar(30),
	address_pincode varchar(6),
	user_type enum('customer', 'agent'),

	primary key(id)
);

create table if not exists restaurants (
	id int auto_increment,
	name varchar(50) not null,
	address_street_no varchar(20),
	address_street_name varchar(20),
	address_city varchar(30),
	address_state varchar(30),
	address_pincode varchar(6),
	status boolean default 1,

	primary key(id)
);


create table if not exists menu_items (
	id int auto_increment,
	restaurant_id int,
	name varchar(50) not null,
	price double,
	category enum('main', 'dessert', 'beverage', 'side', 'sushi'),
	availability boolean default 1,

	primary key(id),
	constraint fk_restaurant_menu foreign key(restaurant_id) references restaurants(id) on delete set null
);

create table if not exists orders (
	id int auto_increment,
	user_id int,
	restaurant_id int,
	payment_method enum('cash', 'upi', 'credit', 'debit') default 'cash',
	amount double not null,
	quantity int not null,
	created_at timestamp default current_timestamp,
	updated_at timestamp default current_timestamp on update current_timestamp,

	primary key(id),
	constraint fk_user_order foreign key(user_id) references users(id) on delete set null,
	constraint fk_restaurant_order foreign key(restaurant_id) references restaurants(id) on delete set null
);


create table if not exists order_items (
	order_id int,
	menu_id int,
	quantity int not null,
	price double not null,

	primary key(order_id, menu_id),
	constraint fk_order_item foreign key(order_id) references orders(id) on delete cascade,
	constraint fk_menu_item foreign key(menu_id) references menu_items(id) on delete cascade
);

create table if not exists order_status (
	order_id int,
	status enum('placed', 'preparing', 'out_for_delivery', 'delivered') not null, 
	created_at timestamp default current_timestamp,
	updated_at timestamp default current_timestamp on update current_timestamp,

	primary key(order_id, status),
	constraint fk_order_status foreign key(order_id) references orders(id) on delete cascade
);

create table if not exists order_assignments (
	order_id int not null,
	agent_id int not null,
	status enum('assigned', 'pickup','out_for_delivery', 'delivered'),
	assign_at timestamp default current_timestamp,
	pickup_at timestamp,
	drop_at timestamp,
	expected_drop_at timestamp,
	created_at timestamp default current_timestamp,
	updated_at timestamp default current_timestamp on update current_timestamp,

	primary key(order_id, agent_id),
	constraint fk_order_assignment foreign key(order_id) references orders(id) on delete cascade,
	constraint fk_agent_assignment foreign key(agent_id) references users(id) on delete cascade
);

create table if not exists reviews (
	user_id int not null,
	order_id int not null,
	restaurant_id int,
	agent_id int,
	rating int,
	comment text,

	primary key(user_id, order_id),
	constraint fk_user_review foreign key(user_id) references users(id) on delete cascade,
	constraint fk_order_review foreign key(order_id) references orders(id) on delete cascade,
	constraint fk_agent_review foreign key(agent_id) references users(id) on delete set null,
	constraint fk_restaurant_review foreign key(restaurant_id) references restaurants(id) on delete set null
);

commit;
