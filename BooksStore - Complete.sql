Create database BookStore; --This bookStore database includes 13 tables, some of them are for processes and the others are for maintenance
Go
Use BookStore;

Create table Books--Maintenance--
(book_id int primary key,
title varchar(255) not null,
author varchar(255) not null,
publisher varchar(255) not null,
genre varchar(255) not null,
price decimal(10,2) not null,
num_copies int not null);

Create table Customers --Maintenance--
(customer_id int primary key,
customer_name varchar(255) not null,
customer_email varchar (255) not null,
customer_phone_number varchar(20) not null,
customer_address varchar (255)not null);

Create table Orders --Process--
(order_id int primary key,
customer_id int not null,
order_date date not null,
total_price decimal(10,2) not null,
statusO varchar(255) not null,
shipping_address varchar(255) not null,
shipping_city varchar(255) not null,
shipping_zipcode varchar(255) not null,
billing_address varchar(255) not null,
billing_city varchar(255) not null,
billing_zipcode varchar(255) not null,
foreign key (customer_id) references Customers(customer_id));

Create table Order_Items --Process--
(order_item_id int primary key,
order_id int not null,
book_id int not null,
quantity int not null,
price decimal(10,2)not null,
foreign key(order_id) references Orders(order_id),
foreign key (book_id) references Books (book_id));

Create table Employees --Maintenance--
(employee_id int primary key,
employee_name varchar(255) not null,
employee_email varchar(255) not null,
phone_number varchar(20) not null,
hire_date date not null,
salary decimal(10,2) not null,
manager_id int,
foreign key(manager_id) references Employees(employee_id));

Create table Stock --Process--
(book_id int not null,
book_location varchar(255) not null,
quantity int not null,
primary key(book_id, book_location),
foreign key(book_id) references Books(book_id));

Create table Reviews( --Process--
review_id int primary key,
customer_id int not null,
book_id int not null,
rating int not null,
comment text,
review date not null,
foreign key(customer_id) references Customers(customer_id),
foreign key(book_id) references Books(book_id));

Create table Promotions --Maintenance--
(promotion_id int primary key,
promotion_name varchar(255) not null,
discount decimal(10,2) not null,
start_discount_date date not null,
end_discount_date date not null);

Create tAble Author --Maintenance--
(author_id int primary key,
author_name varchar(100) not null,
author_biography varchar(max),
author_email varchar(100),
author_phone nvarchar(20));

Create table Category --Maintenance--
(category_id int primary key,
category_name varchar(100)not null,
description varchar(max));

Create table PaymentMethod --Process--
(payment_method_id int primary key,
payment_name varchar(100) not null,
description varchar(max));

Create table Payment --Process--
(payment_id int primary key,
order_id int not null,
payment_method_id int not null,
amount decimal(10,2) not null,
exchange_rate decimal(10,2) not null,
foreign key(order_id)references Orders(order_id),
foreign key(payment_method_id) references PaymentMethod(payment_method_id));

Create table ExchangeRate --Process--
(Currency nvarchar(10) primary key,
Rate decimal(10,2) not null);

Create table Roles
(id int primary key,
name varchar(50) not null,
description varchar(200));

--Inserts

Insert into Author (author_id, author_name, author_biography, author_email, author_phone) values 
(1, 'J.K. Rowling', 'British author, philanthropist, film producer, television producer, and screenwriter.', 'jkrowling@gmail.com', '555-1234');

Insert into Author (author_id, author_name, author_biography, author_email, author_phone) values 
(2, 'Ramón del Valle-Inclán', 'Spain author, dramatist and novelist.', 'rvalleinclan@gmail.com', '666-1234');

Insert into Author (author_id, author_name, author_biography, author_email, author_phone) values 
(3, 'Abraham Stoker', 'Irish author, personal assistant, business manager,theatre critic.', 'astoker@gmail.com', '444-1234');

Insert into Author (author_id, author_name, author_biography, author_email, author_phone) values 
(4, 'Antoine de Saint-Exupery', 'French author, writer, poet, journalist and pioneering aviator.', 'saint-exupery@gmail.com', '777-1234');

Insert into Author (author_id, author_name, author_biography, author_email, author_phone) values 
(5, 'Gabriel García Márquez', 'Colombian author, novelist, short-story writer, screenwriter, and journalist.', 'gmarquezg@gmail.com', '333-1234');

Insert into Author (author_id, author_name, author_biography, author_email, author_phone) values 
(6, 'J. R. R. Tolkien', 'British author, philanthropist and writer.', 'jrrtolkien@gmail.com', '999-1234');

Insert into Author (author_id, author_name, author_biography, author_email, author_phone) values 
(7, 'Oscar Wilde', 'Irish author, poet and playwright.', 'oscarwild@gmail.com', '222-1234');

Insert into Author (author_id, author_name, author_biography, author_email, author_phone) values 
(8, 'Miguel de Cervantes', 'Spanish author, writer,soldier, tax collector, accountant, purchasing agent for navy', 'miguecervantes@gmail.com', '888-1234');       

Insert into Author (author_id, author_name, author_biography, author_email, author_phone) values 
(9, 'William Shakespeare', 'British author, playwright, poet and actor.', 'shakespeare@gmail.com', '111-1234');  

Insert into Author (author_id, author_name, author_biography, author_email, author_phone) values 
(10, 'Herman Melville', 'American author, novelist, short story writer, and poet.', 'hmelville@gmail.com', '123-1234'); 

Select * from Author




INSERT INTO Category (category_id, category_name, description) VALUES 
(1, 'Fantasy', 'Books that contain elements of magic or the supernatural.');

INSERT INTO Category (category_id, category_name, description) VALUES 
(2, 'Thrillers', 'Books that  are characterized by fast pacing, frequent action, and resourceful heroes who must thwart the plans of more-powerful and better-equipped villains.');

INSERT INTO Category (category_id, category_name, description) VALUES 
(3, 'Novel', 'Books that invented prose narrative of considerable length and a certain complexity that deals imaginatively with human experience.');

INSERT INTO Category (category_id, category_name, description) VALUES 
(4, 'Romance', 'Books that are romantic stories with chivalrous feats of heroes and knights.');

INSERT INTO Category (category_id, category_name, description) VALUES 
(5, 'Self-Help Books', 'Books that are written with the intention to instruct its readers on solving personal problems.');

INSERT INTO Category (category_id, category_name, description) VALUES 
(6, 'Children’s Books', 'Books that comprises those books written and published for young people who may not possess the reading skills or developmental understandings necessary for its perusal. ');

INSERT INTO Category (category_id, category_name, description) VALUES 
(7, 'Biography', 'Books that the subject of which is the life of an individual. One of the oldest forms of literary expression');

INSERT INTO Category (category_id, category_name, description) VALUES 
(8, 'Autobiography', 'Books that are a written record of the author’s life.');

INSERT INTO Category (category_id, category_name, description) VALUES 
(9, 'Academic Books', 'Books that are the result of in-depth academic research, usually over a period of years, making an original contribution to a field of study');


INSERT INTO Category (category_id, category_name, description) VALUES 
(10, 'Mystery', 'Books that are a genre of literature whose stories focus on a puzzling crime, situation, or circumstance that needs to be solved.');

Select * from Category





INSERT INTO Books (book_id, title, author, publisher, genre,price, num_copies) VALUES 
(1, 'Moby Dick', 'Herman Melville','PENGUIN BOOKS', 'Novel',25000,20);

INSERT INTO Books (book_id, title, author, publisher, genre,price, num_copies) VALUES 
(2, 'Harry Potter y la Orden del Fénix ', '. K. Rowling','Salamandra Infantil y Juvenil', 'Fantasy',40000,5);

INSERT INTO Books (book_id, title, author, publisher, genre,price, num_copies) VALUES 
(3, 'Hamlet', 'William Shakespeare.','Simon & Schuster', 'Romance',12500,30);

INSERT INTO Books (book_id, title, author, publisher, genre,price, num_copies) VALUES 
(4, 'La corte de los tiranos', 'Ramón del Valle-Inclán','CreateSpace Independent Publishing Platform ', 'Thriller',17000,9);

INSERT INTO Books (book_id, title, author, publisher, genre,price, num_copies) VALUES 
(5, 'Under the sunset', 'Abraham Stoker','Start Classics', 'Fantasy',20000,10);

INSERT INTO Books (book_id, title, author, publisher, genre,price, num_copies) VALUES 
(6, 'Academic Coaching', 'Marc A. Howlett and Kristen Rademacher','Routledge;', 'Academic Books',16000,45);

INSERT INTO Books (book_id, title, author, publisher, genre,price, num_copies) VALUES 
(7, 'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future', 'Ashlee Vance, Fred Sanders','HarperAudio', 'Biography',22000,12);

INSERT INTO Books (book_id, title, author, publisher, genre,price, num_copies) VALUES 
(8, 'The Little Prince', 'Antoine de Saint-Exupery','Bolinda Publishing Pty Ltd', 'Academic Books',25000,20);

INSERT INTO Books (book_id, title, author, publisher, genre,price, num_copies) VALUES 
(9, 'Atomic Habits', 'James Clear and Penguin Audio','Penguin Audio', 'Self-Help Books',13000,20);

INSERT INTO Books (book_id, title, author, publisher, genre,price, num_copies) VALUES 
(10, 'The Black Book', 'James Patterson, David Ellis','Hachette Audio', 'Mystery',25000,20);

Select * from Books




INSERT INTO Customers(customer_id, customer_name, customer_email, customer_phone_number, customer_address) VALUES 
(1, 'Jose Alfaro Arrieta', 'jalrafo01@gmail.com', '123-456','Los Yoses, San Pedro de Montes de Oca');

INSERT INTO Customers(customer_id, customer_name, customer_email, customer_phone_number, customer_address) VALUES 
(2, 'Daniela Ceciliano Cordero', 'daniiC@gmail.com', '111-456','Alajuela, EL Coyol');

INSERT INTO Customers(customer_id, customer_name, customer_email, customer_phone_number, customer_address) VALUES 
(3, 'Denise Arguedas Mendez', 'deniseargmdz@gmail.com', '222-545','Pavas, Rohrmoser');

INSERT INTO Customers(customer_id, customer_name, customer_email, customer_phone_number, customer_address) VALUES 
(4, 'Paula Lopez Loaisa', 'plloaisa@gmail.com', '333-323','Heredia, San Joaquin');

INSERT INTO Customers(customer_id, customer_name, customer_email, customer_phone_number, customer_address) VALUES 
(5, 'Maria Vargas Lizano', 'mariivl23@gmail.com', '444-666','Tres rios, Lomas de Ayarco');

INSERT INTO Customers(customer_id, customer_name, customer_email, customer_phone_number, customer_address) VALUES 
(6, 'Armando Vargas Mendoza', 'armendoza@gmail.com', '666-456','Alajuela, La Guacima');

INSERT INTO Customers(customer_id, customer_name, customer_email, customer_phone_number, customer_address) VALUES 
(7, 'Hilary Sequeira Morera', 'hsqueira2000@gmail.com', '555-555','San Antonio, Desamparados');

INSERT INTO Customers(customer_id, customer_name, customer_email, customer_phone_number, customer_address) VALUES 
(8, 'Daniel Rodriquez Mendieta', 'danirodriguezm@gmail.com', '223-456','Alajuela, Villa Bonita');

INSERT INTO Customers(customer_id, customer_name, customer_email, customer_phone_number, customer_address) VALUES 
(9, 'Steven Lopez De la O', 'slopez95@gmail.com', '545-999','Heredia, Belen');

INSERT INTO Customers(customer_id, customer_name, customer_email, customer_phone_number, customer_address) VALUES 
(10, 'Fabiana Quiros Gutierrez', 'fquirosguti@gmail.com', '787-456','Guachipelin, Escazu');

Select * from Customers



INSERT INTO Employees(employee_id, employee_name, employee_email, phone_number,hire_date, salary, manager_id) VALUES 
(1, 'Liam Smith', 'liamsmith@gmail.com', '222-6565','2020-01-01',600,33344);

INSERT INTO Employees(employee_id, employee_name, employee_email, phone_number,hire_date, salary, manager_id) VALUES 
(2, 'Leonela Willians', 'leowilli@gmail.com', '777-6565','1998-03-03',600,33344);

INSERT INTO Employees(employee_id, employee_name, employee_email, phone_number,hire_date, salary, manager_id) VALUES 
(3, 'Cesar Brown', 'cbrown01@gmail.com', '555-666','2016-12-06',600,33344);

INSERT INTO Employees(employee_id, employee_name, employee_email, phone_number,hire_date, salary, manager_id) VALUES 
(4, 'Julia Jones', 'julij2020@gmail.com', '999-6565','2013-09-01',600,33344);

INSERT INTO Employees(employee_id, employee_name, employee_email, phone_number,hire_date, salary, manager_id) VALUES 
(5, 'Pamela Garcia', 'pgacia23@gmail.com', '111-6565','2018-05-04',600,33344);

INSERT INTO Employees(employee_id, employee_name, employee_email, phone_number,hire_date, salary, manager_id) VALUES 
(6, 'Sergio Miller', 'lsergiomll@gmail.com', '333-6565','2020-07-02',600,33344);

INSERT INTO Employees(employee_id, employee_name, employee_email, phone_number,hire_date, salary, manager_id) VALUES 
(7, 'Fabian Granados', 'fabi01gran@gmail.com', '444-6565','2020-11-01',600,33344);

INSERT INTO Employees(employee_id, employee_name, employee_email, phone_number,hire_date, salary, manager_id) VALUES 
(8, 'Alonso rodriguez', 'arodri555@gmail.com', '888-6565','2020-11-01',600,33344);

INSERT INTO Employees(employee_id, employee_name, employee_email, phone_number,hire_date, salary, manager_id) VALUES 
(9, 'Ericka Matarria', 'erimata30@gmail.com', '323-6565','2020-08-01',600,33344);

INSERT INTO Employees(employee_id, employee_name, employee_email, phone_number,hire_date, salary, manager_id) VALUES 
(10, 'Michelle Bermudez', 'michibermu30@gmail.com', '888-341','2020-12-01',600,33344);

Select * from Employees

DELETE FROM Employees 
    WHERE employee_id = 11 




INSERT INTO ExchangeRate(Currency, Rate) VALUES ('Colones', 0.0019);

INSERT INTO ExchangeRate(Currency, Rate) VALUES ('Euro', 0.903358);

INSERT INTO ExchangeRate(Currency, Rate) VALUES ('US Dollar', 1.00);

Select * from ExchangeRate




INSERT INTO Orders(order_id, customer_id, order_date,total_price,statusO, shipping_address, shipping_city,shipping_zipcode,billing_address,billing_city,billing_zipcode)
VALUES (100, 1, '2020-01-01', 10000,'IN PROCESS','Villa bonita, Aptos Julian','Alajuela','20101', 'Villa bonita, Aptos Julian','Alajuela','20101,');

INSERT INTO Orders(order_id, customer_id, order_date,total_price,statusO, shipping_address, shipping_city,shipping_zipcode,billing_address,billing_city,billing_zipcode)
VALUES (101, 2, '2020-02-01', 20000,'SUCESSFUL','Desamparados San Antonio','San Jose','10101','Desamparados San Antonio','San Jose','10101');

INSERT INTO Orders(order_id, customer_id, order_date,total_price,statusO, shipping_address, shipping_city,shipping_zipcode,billing_address,billing_city,billing_zipcode)
VALUES (102, 3, '2020-03-01', 30000,'IN PROCESS','Rohrmoser, Pavas','San Jose','10107', 'Rohrmoser, Pavas','San Jose','10107');

INSERT INTO Orders(order_id, customer_id, order_date,total_price,statusO, shipping_address, shipping_city,shipping_zipcode,billing_address,billing_city,billing_zipcode)
VALUES (103, 4, '2020-04-01', 12000,'SUCESSFUL','Escazu Guachipellin','San Jose','10203', 'Escazu Guachipellin','San Jose','10203');

INSERT INTO Orders(order_id, customer_id, order_date,total_price,statusO, shipping_address, shipping_city,shipping_zipcode,billing_address,billing_city,billing_zipcode)
VALUES (104, 5, '2020-05-01', 13000,'IN PROCESS','Sabanilla, San Pedro','San Jose','10202', 'Sabanilla, San Pedro','San Jose','10202');

INSERT INTO Orders(order_id, customer_id, order_date,total_price,statusO, shipping_address, shipping_city,shipping_zipcode,billing_address,billing_city,billing_zipcode)
VALUES (105, 6, '2020-06-01', 14000,'SUCESSFUL','San Joaquin, Llorente','Heredia','40801', 'San Joaquin, Llorente','Heredia','40801');

INSERT INTO Orders(order_id, customer_id, order_date,total_price,statusO, shipping_address, shipping_city,shipping_zipcode,billing_address,billing_city,billing_zipcode)
VALUES (106, 7, '2020-07-01', 15000,'IN PROCESS','San Rafael, Concepcion','Heredia','40501','San Rafael, Concepcion','Heredia','40501');

INSERT INTO Orders(order_id, customer_id, order_date,total_price,statusO, shipping_address, shipping_city,shipping_zipcode,billing_address,billing_city,billing_zipcode)
VALUES (107, 8, '2020-08-01', 16000,'SUCESSFUL','La guacima, las vueltas','Alajuela','20105', 'La guacima, las vueltas','Alajuela','20105');

INSERT INTO Orders(order_id, customer_id, order_date,total_price,statusO, shipping_address, shipping_city,shipping_zipcode,billing_address,billing_city,billing_zipcode)
VALUES (108, 9, '2020-09-01', 17000,'IN PROCESS','Montecillos ','Alajuela','20101', 'Montecillos ','Alajuela','20101');

INSERT INTO Orders(order_id, customer_id, order_date,total_price,statusO, shipping_address, shipping_city,shipping_zipcode,billing_address,billing_city,billing_zipcode)
VALUES (109, 10, '2020-10-01', 11000,'SUCESSFUL','Tres rios, lomas de ayarco','Alajuela','11803', 'Tres rios, lomas de ayarco','Alajuela','11803');


Select * from Orders



INSERT INTO Order_Items(order_item_id, order_id, book_id,quantity, price) VALUES
(10,105,1,10,20000);

INSERT INTO Order_Items(order_item_id, order_id, book_id,quantity, price) VALUES
(19,101,2,5,4000);

INSERT INTO Order_Items(order_item_id, order_id, book_id,quantity, price) VALUES
(11,102,3,1,30000);

INSERT INTO Order_Items(order_item_id, order_id, book_id,quantity, price) VALUES
(12,103,4,12,22000);

INSERT INTO Order_Items(order_item_id, order_id, book_id,quantity, price) VALUES
(13,104,5,20,12000);

INSERT INTO Order_Items(order_item_id, order_id, book_id,quantity, price) VALUES
(14,106,6,25,15000);

INSERT INTO Order_Items(order_item_id, order_id, book_id,quantity, price) VALUES
(15,107,7,6,16000);

INSERT INTO Order_Items(order_item_id, order_id, book_id,quantity, price) VALUES
(16,108,8,8,25000);

INSERT INTO Order_Items(order_item_id, order_id, book_id,quantity, price) VALUES
(17,109,9,30,27500);

INSERT INTO Order_Items(order_item_id, order_id, book_id,quantity, price) VALUES
(18,100,10,23,19000);

Select * from Order_Items




INSERT INTO PaymentMethod(payment_method_id, payment_name, description) VALUES (1,'Cash','Cash Payment');

INSERT INTO PaymentMethod(payment_method_id, payment_name, description) VALUES (2,'Checks','Check Payment');

INSERT INTO PaymentMethod(payment_method_id, payment_name, description) VALUES (3,'Credit Cards','Credit Card Payment');

INSERT INTO PaymentMethod(payment_method_id, payment_name, description) VALUES (4,'Mobile','Mobile Payment');

INSERT INTO PaymentMethod(payment_method_id, payment_name, description) VALUES (5,'Electronic banck transfers','Transfer Payment');

Select * from PaymentMethod
Select * from Orders
DELETE FROM PaymentMethod
    WHERE payment_name= 'Electronic banck transfers'; 




INSERT INTO Payment(payment_id,order_id, payment_method_id,amount, exchange_rate) VALUES (14203,100,1,28500, 545);

INSERT INTO Payment(payment_id,order_id, payment_method_id,amount, exchange_rate) VALUES (14204,101,2,13500, 545);

INSERT INTO Payment(payment_id,order_id, payment_method_id,amount, exchange_rate) VALUES (14205,102,3,20000, 545);

INSERT INTO Payment(payment_id,order_id, payment_method_id,amount, exchange_rate) VALUES (14206,103,4,10000500, 545);

INSERT INTO Payment(payment_id,order_id, payment_method_id,amount, exchange_rate) VALUES (14207,104,5,8500, 545);

INSERT INTO Payment(payment_id,order_id, payment_method_id,amount, exchange_rate) VALUES (14208,105,1,16700, 545);

INSERT INTO Payment(payment_id,order_id, payment_method_id,amount, exchange_rate) VALUES (14209,106,2,20500, 545);

INSERT INTO Payment(payment_id,order_id, payment_method_id,amount, exchange_rate) VALUES (14201,107,3,22500, 545);

INSERT INTO Payment(payment_id,order_id, payment_method_id,amount, exchange_rate) VALUES (14202,108,4,23500, 545);

INSERT INTO Payment(payment_id,order_id, payment_method_id,amount, exchange_rate) VALUES (14200,109,5,18500, 545);

Select * from Payment

INSERT INTO Promotions(promotion_id, promotion_name, discount, start_discount_date, end_discount_date) VALUES (2000,'Seasonal Promotion', 0.10, '2020-10-01', '2020-11-01');

INSERT INTO Promotions(promotion_id, promotion_name, discount, start_discount_date, end_discount_date) VALUES (2001,'Employess Promotion', 0.60, '2015-10-01', '2025-11-01');

INSERT INTO Promotions(promotion_id, promotion_name, discount, start_discount_date, end_discount_date) VALUES (2002,'Local Promotion', 0.05, '2020-10-01', '2030-10-01');

INSERT INTO Promotions(promotion_id, promotion_name, discount, start_discount_date, end_discount_date) VALUES (2003,'Social Media Promotion', 0.20, '2020-10-01', '2030-10-01');

INSERT INTO Promotions(promotion_id, promotion_name, discount, start_discount_date, end_discount_date) VALUES (2004,'Business Promotion', 0.40, '2020-10-01', '2030-10-01');

INSERT INTO Promotions(promotion_id, promotion_name, discount, start_discount_date, end_discount_date) VALUES (2005,'Free trial', 0.100,'2020-10-01', '2030-10-01');

Select * from Promotions





INSERT INTO Reviews(review_id,customer_id,book_id, rating, comment, review) VALUES (1000,1,1,7,'This book feels very high quality. I’m very impressed! My mom will love this for her collection.', '2020-10-01');

INSERT INTO Reviews(review_id,customer_id,book_id, rating, comment, review) VALUES (1001,2,2,9,'Awesome book', '2022-10-06');

INSERT INTO Reviews(review_id,customer_id,book_id, rating, comment, review) VALUES (1003,3,3,5,'I love this version and would definitely love to get more once my next paycheck hits. I was excited to go somewhere
in the car or start cooking dinner just to listen. It’s the next best thing to seeing it live. Even better than a movie, really.', '2023-03-08');

INSERT INTO Reviews(review_id,customer_id,book_id, rating, comment, review) VALUES (1004,4,4,6,'It was not what I expected', '2019-11-10');

INSERT INTO Reviews(review_id,customer_id,book_id, rating, comment, review) VALUES (1005,5,5,10,'The result is a bunch of stories, ranging from the flagrantly biblical (The Rose Prince) to the unbelievably dark
(The Shadow Maker, the Castle of the King). The stories tend towards sad rather than frightening, and if you are a normal parent, you might not want to read them to your children.', '2018-06-16');

INSERT INTO Reviews(review_id,customer_id,book_id, rating, comment, review) VALUES (1006,6,6,10,'Great text that defines what effective instructional coaching is and he daily drivers educators need to focus on to
offer high quality coaching on campus.', '2017-07-21');

INSERT INTO Reviews(review_id,customer_id,book_id, rating, comment, review) VALUES (1007,7,7,10,'This book is well researched, and the author had great access to Elon Musk. ', '2016-01-12');

INSERT INTO Reviews(review_id,customer_id,book_id, rating, comment, review) VALUES (1008,8,8,8,'If there is one book to recommend for any age, that would be The Little Prince.', '2022-05-02');

INSERT INTO Reviews(review_id,customer_id,book_id, rating, comment, review) VALUES (1009,9,9,5,'This is a solid skimmer. Just another supposed groundbreaking self-help book from some guy who has been declared an
expert by repeating well known ideas to a corporate audience and can effectively write for the masses at a sixth grade level.', '2021-12-15');

INSERT INTO Reviews(review_id,customer_id,book_id, rating, comment, review) VALUES (1010,10,10,7,'Husband enjoys this author. Fast shipping and in perfect condition. Highly recommend', '2021-12-26'); 


Select * from Reviews
SELECT * FROM Customers
SELECT * FROM Books



INSERT INTO Roles(id, name, descripcion) VALUES (1,'Liam Smith','Employee');

INSERT INTO Roles(id, name, descripcion) VALUES (2,'Leonela Willians','Employee');

INSERT INTO Roles(id, name, descripcion) VALUES (3,'Jose Alfaro Arrieta','Customer');

INSERT INTO Roles(id, name, descripcion) VALUES (4,'Julia Jones','Employee');

INSERT INTO Roles(id, name, descripcion) VALUES (5,'Pamela Garcia','Administrator');

INSERT INTO Roles(id, name, descripcion) VALUES (6,'Sergio Miller','Employee');

INSERT INTO Roles(id, name, descripcion) VALUES (7,'Hilary Sequeira Morera','Customer');

INSERT INTO Roles(id, name, descripcion) VALUES (8,'Alonso rodriguez','Employee');

INSERT INTO Roles(id, name, descripcion) VALUES (9,'Ericka Matarria','Employee');

INSERT INTO Roles(id, name, descripcion) VALUES (10,'Fabiana Quiros Gutierrez','Customer');

Select * from Roles
Select * from Employees
Select * from Customers
/*Add administrator roles and their information */ 




INSERT INTO Stock (book_id, book_location, quantity) VALUES (1,'Heredia Centro',10);

INSERT INTO Stock (book_id, book_location, quantity) VALUES (2,'Alajuela Centro',3);

INSERT INTO Stock (book_id, book_location, quantity) VALUES (3,'Cartago Centro',10);

INSERT INTO Stock (book_id, book_location, quantity) VALUES (4,'San Jose Centro',6);

INSERT INTO Stock (book_id, book_location, quantity) VALUES (5,'Multicentro Desamparados',3);

INSERT INTO Stock (book_id, book_location, quantity) VALUES (6,'Oxigneo',8);

INSERT INTO Stock (book_id, book_location, quantity) VALUES (7,'Multiplaza Escazu',4);

INSERT INTO Stock (book_id, book_location, quantity) VALUES (8,'Plaza Praktico',2);

INSERT INTO Stock (book_id, book_location, quantity) VALUES (9,'City mall',7);

INSERT INTO Stock (book_id, book_location, quantity) VALUES (10,'Plaza Tempo',6);

Select * from Books
Select * from Stock 

/*UPDATE [dbo].[Docente]
   SET 
      [Foto] = 0x89504E470D0A1A0A0000000D494844520000012C0000007F08060000005510FF98000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA86400001BBA49444154785EED9D8997544596C6E72F9A19673973E6CCD8E38662A3A282A0B6DD1C69686D976E46465A5BD4B6410B10144110511115410405444441A05854D692DD2A05D929A8252B332B2B332BDF12F3BEA857DD5551F765C6DB72A9BCBF73BE534265BCF73022BF17CB8D1BFF201886616A04362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A06362C86616A869A32AC9EBC2D5A2E9B62D70F05B1E1605EACD89317CB1A73E29DED39B17C674EACFA362F367D5F107B7F32C4993653F41A6E4186618605556D58AD495B6C3CD42B5E5A9F15BF5E9416235E4CFAD3CC8498B4B45BBCB2292BBE3E5610C91EDBBD32C330B548D519565BDA162BBFC98B496F76D326144237CF4888A91F64C4E6C305912BB8376418A666A81AC33A76DE10CFAFC9889B5E4A906613B5EE9893126F6DCB898E6EEE7531D5C7BF7F34BEA4EA918A1BD6890B8698FA7E86349572E8B68684787B7B4ECE8F314CB5401994AA7AA46286859ECDCC4F7A4813A984C6CF4FCAC97C86A906288352558F94DDB0D08FF9EA48410EC928E3A8B460A2DD39EE6D319585322855F548590D0BC3AE199F564FAFCA4B0F2C4C8B53574CF7A919A6FC5006A5AA1E299B615DEC34C5834BA25FF98B4B98DBDADDCC4344A6325006A5AA1E298B616162FDEE97A31F02C254C6CC4F8BFB1726C5D857D26264C42B8C0883401C18C3941BCAA054D523B11B56D31943FC724E1769087E34D9E99D2DDE92133B4E14C4E9ABA6C8139D1FCC3CA573B668BE64CA88F7973766C5F805F4F57484100B049C324CB9A10C4A553D12AB611D396BC85E1065063A4274FB07BBF332E23D282879F2A229E66FCE8A51B3E8FB5062B3622A096550AAEA91D80CEB67A71774FBDC60C3C0896F748BEDC70BC2B4DC8B45047A5FEFEDCA893B4A0C4FD9AC984A431994AA7A2416C3EACAD8725E8932836282917CB22F1FB951A9148B0163B362AA01CAA054D523911B96E58CC1A6AEF01FB9FEF8BBDDE26AAABCF14F8D270A62F4ECBFF7B6D8AC986A81322855F548E486F5E19EFC2023D2D1C2AF72C288B957E5C5854E534C58D4CD66C554159441A9AA4722352CCC5BDDFAA2BF49766466286FBF6A28483B831C5A0C532D5006A5AA1E89CCB06CC775FEB0DC5F60E8EAEFF26E69866106421994AA7A2432C3DA72B4409A9297166FCD55BC67C530D50A6550AAEA91480CAB600AF1C0EBFA210C48A287C979866168288352558F4462585F7CAFDFBBBA6B6E9A93E6314C09288352558F84362CCC5DF9D9D48CA123C330C5A10C4A553D12DAB0B0579032264A88B582C1310C531CCAA054D523A10DAB615D9634274AD85BC8304C69288352558F84322C644CD0CDC4F0087A576E3986618A431994AAD8B1AD3E5511A10C0BC196943951E228724D4C53183F9C103DAB3F14C919CF8B8E87278AF631A344DB2D378AD61BAF953FF167FC7D72E65F9CCFAD1446F34959AE2AB04D61A78E09EBECBBC2383A4D18FBEF13BD8DD78BFC8EFF1085AFFF51E4B75EE3FCF72F84B177AC308E3DE97C6E99B0938765B96A0087EFEE3F65C88349A6ADCCC8ECB37FCB38323321EE9997962F5F64FF683C59103DBDF1BC862983521515762E2B7ABFFB4664962C125D53FF203AEE1B2BDA465E27AEDEF0DF526DB75EEFFCDD38D135ED09917967A9281C6EAA587B0B6558D852A31A1325F4C2B23155EC70C1F8A945A45F7B45B4DF75DBDF1A8A1FB5DF799B482F785518A77E74AF585EEC74B3B09A1B44EFAEEBA431F9557EE72F84757286731DC77C2B005262CFFB3C5B3293872A98190EEABD9818FC056EFA59EF65EE056550AA4261DBA270FCA87CE9C190A836554C686F9937170BABBDDDBD60790865580FBDA557B9C88CC0D0148E1F73DE6A53C84611545D4FFEAF289C3CEEDE215ED03B2A1C7A8834A1C03AF45B61777DEFDE215ECEB499E2998FC2A7EE1EE91817CEB9CCBBD3B4D56C58681B9D531E21DB8E5FB58DB85E6496BE217B69E520B06161FE0A1B86A94A50F57913A71956B19249917AE9AF6423884AA98619C24A797F294251E812E6F13FD38613918C637F72C66809F786D18260E77776382304679847B5D9A0C24B1C5947AAD1B0EC7C4EF6E2A9B612561DF78D29CB4B32B061B55C36C90AA074AEA34AE657AA8442D3217175EC68B2E223D7B8D1A27024DADE8A9D38200ABB6F224D266A61FECB4EEC77EF1C0D309447DE49936D350A21171C527453BF53E5056550AAFC605EBC203A27FE8A6E2311A9F5E6FF11B92FBF70EF180F810D6BDB71BD0A19353BC1B15703C86DDA285A89CA8E53B85F6EF326F709C2615D5A27F2DBAE21CD252EE17ED6C535EE138403735538B0846AAB9590179441A9D205F3A3ED778D22DB461CCAAEFDC8BD73F40436AC55DFEAE5BD9AFC56B75B82C97EBC8AACE07229BB76B5FB24C1B0CEBD4F1A4AB9649D7BCF7D9260FCD46A8ABBE6F99B548F5B5E5006A54A07E3CC697175F448B23DC4A9DCA6CFDC278896C086B5E46BBD15C2E9AB336E89F8A0EE5B4E75F594EE42E6BEF89CACD8722BF755B02EBB75793D6922E5167A7841B894707A56AF564FCFAA5F5E5006A5AA145667A7681B5FA6A90745E8D517BE6F729F243A021B169680A90A50D5B021FED503EABEE5144EE5290626235B475C4B56AC8E1077D5F9C8649198F2B8FC892565EA733AC23C838CDBF2819D3A2AF25BFF8534101DF5EEBE5118071E10854393E4CFDEC61BC8CFE908CF21E3B67C902B08316969F095406CD847ECD5931F6664CEB7F1F3E9CF0591179441A92A8A6D89C4D43F906DA09410E6D039E531919A3B4BA416CE17A9869922F1E8EF64DBA13EEF25B45B2BD9E53E50340436ACD91BF48E9C9FFFC5F037AC5D3F7807C5DA3D19D13E6E0C59A1C5D4397982C86EF8545857AFB8571A8C79A55564D77F223A274D20CB1753C7FD639CE7D20C3531BA4561D72DA4791493B1EFDEBE79A7FC55F7420AF92BC2BAB0DAF9DC3D64F9A2729E07CFA50BDA20556FC574DF82949CF6400A6DAAFF8CA3E7D6ECCDCBA3E8A8F2BAF282322855C540DBA0EABE98604AF91D5F0B3B4F27D6445BC6500F41A454794AC9179E754B474360C39AF3999E6121A82E6EA8FB9653C5C236F086A22AD24B6DE3EE16F93DBB9CD6A1B952E17C2EBF6B875C0DA4AEE7A5F4A285EE058A63B5CCA14DC34B7B6E11767BA3535277A5C51676DB36C78446D0D7F390D532CB2D5F9C23E7F47763400872C6C94DBA670CE07330AEA0A78E7B4119942A2F103273E5973791F54EA9EDF69122BF6D8B769BB37B7B7D8547F41E886E9537B061BDEA18115501AA5EFC74F81BD65AA7C15298E7CE8AD6EBF58782D8FA60A7D36E697F20DECA4F002AE618CCF3E7DCD23476E6B4D390FF99340C52871FF3D5F3194421290A4D0FD3D7258495433BF3B35B9806DF3FDDE066E8378BBB0387E060423FC8EAA3179441A9F2025B6CA83AA7845007AF5E7C29324B1693D754855140547B12031B16A27AA90A50F5F4AAF85709A9FB96531F3943070A046E52154829F9DCD3CE973D64360BA320BAA63F455E9F526AF64CB7208D79E219D22C281947A63A8D3264BC9D6D08E3F014F2FA948CE3CEFFB32260A84ED517259855D8C49230BB3B7D9A96179441A9A2C0B0AD6DD408B2BE55754C70CCCAE98D05C634E5D405756D5572D41001810D0BDD60AA02544D7863F81BD6C7440FCBEA68D78EB7C2466674B3A300D1CCBA8D080B01584922C9B769C75B19FBEE77FEC111ED66B09CE1D8BE71E47D54E1F9F09C5E20FF1A555FAA703625E6AAA2E0A066847BBFBCA00C4A15456EE37AB2AE55C1D4104C1A18CB921BA6DB273F485E5F15168CA220B061E9BEBDB0C72AEE3307A9FB96531B0E0E352C6451A02A6E886EBA4E9817CEBBA5A2C138F3B3F6AAA4576C16629E28935095DFFE6FCE5BBDF8D0D22F7228AAB92A89AC1014D82348D5152544A54789EE0A3AE4056550AA283AFFA8B74730FBC9C76E097F60D5AF67D50AB970435DB7984A4D41E810D8B0FC34881F9DF17D9CC8FD60314877AF24953AA7F3A14964A5A9EA7EE375B744B4207303753F555819A240AF89320855D64FAFB825A20593EAD4FD54C9DE1DC1BB8D7A531693DE8C3E0B6E7BDA16B7CCD26B3B5E5006A54A05F39F5A73A6E346CBE9036D9CFF4108CD917B5F9D172C794D0DE92EF41423B061A1D7A4BB3282E1632DB2A759AF7B8F61C040EC6EBD86238764CED0310E10F6A0F50C8E86843818DD5A93EDC86D556C48168A5CABDE336CF927E779536EA1BFF390E65EC16D31E5699BB55EAF97E5056550AA547ABFDD43D6B1AA9EE5EFB8258A830C0CD84AA63BEC2BA5C413E18785810D0B4C599E212B41D5532B6B737B8EEEB1FBEACA52EFBEEFC80A538555C1384103A1EEABAAF7C03EB7441F76C76ED21C8608AB82315268FA1D7D5F4576C71EB7441FC8BDA6D33B46EEABFE743051B3EF54F9B3356496BF4DD6AF2AE3F429B7040DA628D28B16882BA36E21CBFB92D32343CE2DA4518AA22B1BCAB096213D07510943E40CAFBA3211F7BBCBC0F36B4B1B32BE18C8523910DD3D83D9756BDD12F180ACA5D47D55A9F358BA7B06AD0BABDC12F1A03B8F86ACA503397141CF2C9E5F13DFB631A45FBAF5C5D2A6E9056550AA54927F994ED6EF4061B29D0C31304DB992875C6A5439BF42D6D29E551F08ABAB4A22DDC1B1F3FA2B229FEEAFAD6121EC5527AE66C2A2A1BDC7D42B2F9395A82AEEFC41852387C9FBAA4ABF3AD72DD107327F52C6A00AA990E3C4EE3A44DE57159E7720BAA790AFFC26DE36A91303E6056550AA54B0DA4CD5EF40610579205622217A56BC270396A9CFFB115278279EFA3FB97A8855C438086558A6F34C63E6EBCD153CF07A5A7EBE56387D556F51E1A5F543036393CF3F4356A8AA5031301A207D2D755F5578330FC438FA04690CAA10EC192BF936F2BEAA10BB3510C4C55175A56AE7C978E6AFFA79616DE9DD205E5006A54A4567E54ECE236112FDE811796680DFFD819410298F2052F3D245F749E223946181459A79DDA1EDC7E36D2051B27CA7DEBF6BFD81A16F69CC4D5115AB2AAEB7503FD81346DD57953A9756F8FEF7A431A88AFD4415AB40DE77889A06AF742ED35C213C1CF3B173D89646DD77A0BCA00C4A958ACE7900E849754EFC0DF93BBFC20A736ECB66CFBD877110DAB0747B2210368AAAF33DD508E60611F94CFD1B549D6D1F1AB2819347A80A5615FB17DE30C8FBAAC2F30EA4D0349936860192AB7371639BE4BD87E8E06FDD027DBCB35DCFB08E9E8BB731E2641DEABE03E5056550AA54CA91A40FA7E924E73408A3A5D9BD6B79096D5860CA7B7AAB85D007BBAB7F2E4B7785074740514B09C9E94F9395AD4A3B634240B0BF90BAAFAAE4B383B7B81847FE481B832261C6BC4FD44891F71DA2EF1F750BF4F1FE2EBD2121EA394E74421BBCA00C4A954A9CB9AFDA1E182F338906DDEB1A159118969FF30911508734B5D50A0C08B98FA8675785FD9414BA7B0811911E27C68FCDE47D55A97B0A75F71022223D4E707418755F5578DE8160E701555FAAE23E1C65EA07A55FE45E5006A54A45774B96AE10C7879759EFC1FDF18F063489C4B0E4977C99FEA64FEC2F8CEB00CAB0206A9D7A664A3F3BC3618A9EF797910D40556EEB976E8978D0CD72DAB362B95BA20FEBE725A431A8B2AFC47BE0806E9653EBF422B7441FBA2FD0855FD22F9C2840EBC6A1ABD47D07CA0BCAA054A9F8D9F85E4C48BC870353AD368F5C66152412C30247CEEAF7B2206471887B8FA15FDAD2B6F66E7B04CD7A91DFBE956C08AA52735E724BC40302F6A8FBAACA376E734BF4615FD94C1A832AEBC4F36E8978403606EABEAAF0BC0369EDB2C93A53F5E092F8029ACFB5EBCDED7A4119942A95CCD22564FDEA0A671522819FAF6D3B652632C302383095AA142F216BA955251D2D44473FEAA397F84D8BF7FC87D9DA4A3688211A3D32B22C0D2AD856A19B66447D93DAB94BA431A8CAEFBCD6E906C5342769661DE3FF4FF2BEAAECECE0E5743429DD701B2C1AC50162BCA8FBA9F2823228552AF9DD8D64FD1613DA487AFE3C7958452D10A96175666C71B7CFA3BE677CDA230FB5AC243D795B3CA131DFD0AF87DF4E95DC65A0BB9B3DF7F906B744B4643F5D43DE4F55C7AFEF754B0CA6B06724690EAAAC4B9FB825A2C53ABF92BCDF1039CFD96751836958A7B7970F9915A206F186BAA993BDA00C4A950A165910BC49D5B3AAF609F78BEC67EB625FF8899A480D0B349ED49F03EAD7D4F733D2EC2A415BCA9606443D979770AA6F29B0178B6A284334E64EA787106DA3B133DD5A313910B2535268A746DE35C2F98646DCE88D6E79802A793F45784E0AEDE47D331364684A18BE3CA2FF1DF0823228551489C7F5D2CB20B8396A905BAD7022DEDD0F911B160892F41F2791E818419420CB82CEC4E840E9A67CD65DA18352F3E82F5D50FC643A354EFDE4961A8C9D3E491A0425ABB978E652BF58279E25EF4309CF4981783FDDF94824FA8B6A3E1547BEF969535E5006A58A4237811FD4BBF75BB7540498A63CA5072B8B7809C6154C1A8B616188A79BED51158E058BBBB795CADA814CF5DED79222A97106A1C419332212986A2894B29FAD770B860389D9A8EB534A3CFE7BB71485DD773417611294AC8BD16CE4D61E0A3AC2F31543378014427B08DBEA607AD33ED49F5A80BCA00C4A15058678BA0750A0171E349FFB209CB68E23C1065DDB1972C6B1573616C30278D36063305549A584934B70506BD81CDB2ADD395B4E86FA9D679372860E5809F50336810EACC462C2DC83CCDE506A72CC0BA75C76CD47E4B5BDD4BB7FAF5B98C66EDF491A052544BEE3D8AEE0D8BE4F96B63B8AE709478610B425B23E0921CC21E822105ED2988FA5AE5B4C5E5006A5CA8BCCDB6F92F54DA91D79DDC3E464330C917AB981BC765F6F6B71A40B4BB11916C0F2F2FD0BE88AD211D22B230508E623B08A1704C3694818FACDDD98F5D578556D3C14E07F3A7A599A39A9FA85AC8E983CF503D2D6265F788EBC9E9770C24E6973B4E5B617CA2CBC24833889847A45297409E3D89FC8EB79EAD024A760E936819D15547D7A0987A55E49FA6B6B97BBACC0230A2F288352E5051248B6DF712B59EF9410218FCDD07EC16667F4D2A96B0E144C31AADE56AC86052E264CF1C0EB017A348A605E887D4274F9E6C30571FCBC2113E7211D2D8678E88D9D77FE8C9437482F82E1C0B495995026D5AF157B828FC7CDF367FDA7951D3D52F47CF06EC9371FB231207BE4953B46D2D7F150DB88EBB5F3C8E328ADFCF67FA54DC3430877B0CE2C75BA9825DEDCF93619A49ADFFE5FE475BC84E72975C4573F98CB9AA8B92FB45FB7396D6DE9D759F9C22D06166CD01EF179EA3A3AF282322855C5C87DF90559F7C584B83DCCBD967A91A14DCB14DC3EDA357A5BF96FC29F9C13BB610104644E7E2BD81BA8D28A62EF23867A542596128689C80D8FC681A48098E7C24F1C6289DC47BA4BD8AA3031EB0724EAA38CA39490E2D8D8EF0C395A66C9E11E4E82963F9B1B642E760C23A972A584792E3FE04C01DD1CEBAAB082BC60734E9E8C84AD3C6BF7E5C5E22D39B97DEBE619C18DAA5F5E5006A5AA288EE9E8EE695585939DB170831D10087D40BB43323E0CFD3A1EFC1559A694902102273A85A52C8605B015E7B98FFD4D485652688CEB88D4318140E3D18C3A8F5BA9869925DFA043B1B5A3CEE39679FCCFF279FC825E3955CF9596179441A92A05362A63D332D50ECA294CEE9BAD97DDA70A47D90C0BE07BB2FABBBC56EAD84AEAF6B929B91F2D5270C8A9669EACB89478FA4939491A08E4A6D2CC93159B9A1E769E23F804AE6E8EB372CA0BCAA054E98079A6F6B17A317971082B9646CB0FEED384A7AC86D50F8EF5F673847839854DDC9712F184DEA34B1CB49B1E5638593A746C8C99D34E3D13B58CC38F3B6615EEF9D12FAB36D3F282322855BAE03CC03853CF78093DABA8F36655C4B0006256D6EECD8B3BE654877161E214A975634FE36C59F27C36AA82E312969623CB6E6A9BC2FAF165D254E292F5E33C79DFA8C0C1A971F6F2315F861009EA77AABCA00C4A951FB040A37B566614C29C9579F9927BF7E8A89861F58340CCB02B2D6184536FE67CD623577CCA09A28C63EFAA8F1D2D8F1C8B03C468F536DE401A4C54C2F5EDF646F78ED1D272D994698EA83611465895466240ECDAA07EAFCA0BCAA054F9C52EF4CA9797CE79956184434DA29860A7A8B861F503E342F8C0FD0BE98A8D5A304844372314A252D83D19B98D01610654C50715D2D866DE5C1CFFC656A35BF67E705C3D65384185EBC95E9573FD38C19984EFED8AEE658995F0FE1C693A8685851D2F2883521514842E744E798C6C3B61841E5CE198FF782E3F548D61F5834863047A6217FDD857FDEDF32B250C039087EB0B674890C997B747550C6C1ACDBCF566F81E97D3A3CA2C5B1AF9597025E96D17D6A905A17B5CD8F06C9D7A4DC66795136C05432F5F77EFA12A1C078763EC10A4DCCF210DC3C2D0D10BCAA05485C2B645E170939C53C5E9DF647BD214CE0490477BF95E7DF64FD519D640F0EF47D71D735D7FFDA447265CC31619AAF229216015068589D6FD4E373D68B47CD9B02CD17BE8809CE3EA7868A23CCA9E6A20FDC2EF118F85CFF7361D8C6E9E2A28B629ECCEEFE41C97B177BC3CCA9E32A67EE5B75D238C7DF708AB65B653EE5BA77CC42BB33E419029F29C615704F2F5536DAA5F77CD4DCBFC6F382A6CA051F5A393F514D7A806F082C391F4C9179ED59A9CC761175871C601BC91EC45F441551B160526EB11817CF2A229E70A763717644A9B3DCD863870DA103F5C32E556894AE7D88A04C310E6C50BA2D074484609E7B76D913FF167FC3D76C857358E01D9D9F3C24EEC1376DB7661B76E12F6D52DD2D464A4BA55DDC7BEA573B67C61C27CD0C6D0D68E9C33C4D5945D32124CE73057EA10DE6A005B7B8C9F5AE45ED3FCCEED32232D7A50D85E83D140397A525ED49C61314C2DA0B38711875430FE60C3629818C014066552031547B6D3E10E1B16539760548300E638C0B57572CA63A29EF1071B165357A4B3B658B3372F4FF64658411C612DC818421994AAE3172ABBC8508BB061317501323660F56FD4ECC1ABCCD33FCE04D84A5D1C9DD3A310FB352C1686CA0C1B16336C41980256EB4A9DE48DCF4405561575D2CE4C5FCD13EE4160C362862DC85B4599852AF4BA10261316A4509AA8B9DD67EBB1EA0EE9A856D8B09861CBC54E533BD0189BF08F9E0B3EA784A06464B8A5AEADEAAE79299167BF0A041B1633AC99BF59FF74246CDD0A92B103A747FBC9A8BB6C473C1B83EB01362C6658835541DD63EBFB851CF0380CB5D8562EEC79C5B90238960E193FA8EB50424F0ECFC404830D8B19F6E8ECEBA384CDC953DECBC8AC1ECB1A73B267841EDB532BBB036F94DE709063AFC2C086C5D405301CCA40CA29CC7155701BDEB0800D8BA90B6014B337F83FE8342A21FB030E7665C2C186C5D40D984C9FB55E7F123E2A8D9F9F14173A394A340AD8B098BA023D2DCC4551C6128790C32DAE434DEA11362CA62EC1443C3285522613951AD665AB2AB3ED70800D8BA95B90A06FD157B9C84FD041B43B924B32D1C386C5D43DC820BA646BF09CEE10F60F4E5B9191594911A3C5C4031B16C3B820373BD26C2F76CCEBF177BBE5915D943941235F4AC8E8F69737666590290EB260E2870D8B613C80052114E14C9B299A2F993213C3D97653249CBFE378AACAC086C5304CCDC086C5304CCDC086C5304CCDC086C5304CCDC086C5304CCDC086C5304CCDC086C5304CCDC086C5304CCDC086C5304CCDC086C5304CCDC086C5304CCDC086C5304C8D20C4FF035A6E8ACBB9E7C4F40000000049454E44AE426082
 where cedula = 205990062
GO*/