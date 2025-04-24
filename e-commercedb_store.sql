create database ecommerce;

create user omg@localhost
identified by '123';

grant all on ecommerce.* to omg@localhost;

use ecommerce;

 create table brand(
 brand_id int primary key auto_increment,
 name varchar(100),
 description varchar(1000)
);
 
create table color(color_id int primary key auto_increment,
name varchar(100),hex_code varchar(100));

create table product_variation(
variation_id int primary key auto_increment,
product_id int,variation_name varchar(100));

create table product_category(
category_id int primary key auto_increment,name varchar(100),
description varchar(1000), foreign key(category_id) references brand(brand_id));

create table size_category(
size_category_id int primary key auto_increment,name varchar(100), 
foreign key(size_category_id) references color(color_id));

create table attribute_category(
attribute_category_id int primary key auto_increment, name varchar(100), 
foreign key(attribute_category_id) references product_variation(variation_id));

create table product(product_id int primary key auto_increment,
name varchar(100),brand_id int , category_id int, base_price decimal(2,2), 
description varchar(1000), foreign key(product_id) references product_category(category_id), 
foreign key(brand_id) references brand(brand_id), 
foreign key(category_id) references product_category(category_id));

create table product_image(image_id int primary key auto_increment,
product_id int,image_url varchar(100), 
foreign key(product_id) references product(product_id));

create table size_option(size_option_id int primary key auto_increment,
size_category_id int,label varchar(1000), 
foreign key(size_category_id) references size_category(size_category_id));

create table product_item(item_id int primary key auto_increment, 
product_id int,color_id int, size_option_id int, price decimal(2,2), 
stock_quantity int, foreign key(product_id) references product(product_id), 
foreign key(color_id) references color(color_id), 
foreign key(size_option_id) references size_option(size_option_id));

create table attribute_type(
attribute_type_id int primary key auto_increment,name varchar(100));

create table product_attribute(
attribute_id int primary key auto_increment,product_id int, attribute_category_id int,
attribute_type_id int, attribute_name int, attribute_value varchar(100), 
foreign key(product_id) references product(product_id), 
foreign key(attribute_category_id) references attribute_category(attribute_category_id), 
foreign key(attribute_type_id) references attribute_type(attribute_type_id));