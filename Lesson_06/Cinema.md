## **Tạo Database**
```sql
CREATE DATABASE Cinema
```
***

**1.Tạo bảng nhân viên**
```sql
CREATE TABLE employee(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM ('Male', 'Female')
    address TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    email TEXT NOT NULL,
    position TEXT NOT NULL
)
```
***

**2.Tạo bảng ca làm việc**
```sql
CREATE TABLE shift(
    id INT PRIMARY KEY,
    shift_type ENUM('Morning', 'Afternoon', 'Night','Full-time'),
    start TIME NOT NULL,
    end TIME NOT NULL, 
    month DATE NOT NULL,
    salary_per_day BIGINT NOT NULL
)
```
***

**3.Tạo bảng lương thưởng**
```sql
CREATE TABLE bonus(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    bonus_money BIGINT NOT NULL
)
```
***

**4.Tạo bảng lương phạt**
```sql
CREATE TABLE punish(
id INT PRIMARY KEY,
    name TEXT NOT NULL,
    punish_money BIGINT NOT NULL
)
```
***

**5.Tạo bảng nhân viên_lương thưởng**
```sql
CREATE TABLE employee_bonus(
    id INT PRIMARY KEY,
    id_employee INT NOT NULL,
    id_bonus INT,
    bonus_number INT,
    bonus_date TEXT,
    total_bonus_money BIGINT,
    FOREIGN KEY (id_bonus) REFERENCES bonus(id),
    FOREIGN KEY (id_employee) REFERENCES employee(id)
)
```
***

**6.Tạo bảng nhân viên_lương phạt**
```sql
CREATE TABLE employee_punish(
    id INT PRIMARY KEY,
    id_employee INT NOT NULL,
    id_punish INT,
    punish_number INT,
    punish_date TEXT,
    total_punish_money BIGINT,
    FOREIGN KEY (id_punish) REFERENCES punish(id),
    FOREIGN KEY (id_employee) REFERENCES employee(id)
)
```
***

**7.Tạo bảng lương cơ bản**
```sql
CREATE TABLE salary(
    id INT PRIMARY KEY,
    id_employee INT NOT NULL,
    id_shift INT NOT NULL,
    shift_number INT NOT NULL,
    salary_per_month BIGINT NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES employee(id),
    FOREIGN KEY (id_shift) REFERENCES shift(id)
)
```
***

**8.Tạo bảng tổng lương tháng**
```sql
CREATE TABLE full_salary(
    id_salary INT NOT NULL,    
    id_employee_bonus INT NOT NULL,
    id_employee_punish INT NOT NULL,
    month DATE NOT NULL,
    total_salary BIGINT NOT NULL,
    FOREIGN KEY (id_salary) REFERENCES salary(id),
    FOREIGN KEY (id_employee_punish) REFERENCES employee_punish(id),
    FOREIGN KEY (id_employee_bonus) REFERENCES employee_bonus(id)
)
```
***    

**9.Tạo bảng khách hàng**
```sql
CREATE TABLE customer(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM ('Male', 'Female')
    address TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    email TEXT NOT NULL
)
```
***

**10.Tạo bảng nhà sản xuất**
```sql
CREATE TABLE producer(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT NOT NULL
)
```
***

**11.Tạo bảng diễn viên**
```sql
CREATE TABLE actor(
    id INT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
)
```
***

**12.Tạo bảng thể loại**
```sql
CREATE TABLE category(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
)
```
***

**13.Tạo bảng format**
```sql
CREATE TABLE format(
    id INT PRIMARY KEY,
    format TEXT NOT NULL
```
***

**14.Tạo bảng phim**
```sql
CREATE TABLE film(
    id INT PRIMARY KEY,
    id_producer INT NOT NULL,
    title TEXT NOT NULL,
    director TEXT NOT NULL,
    poster TEXT NOT NULL,
    description TEXT NOT NULL,
    length INT NOT NULL,
    rating ENUM('PG','G','PG-13','R','NC-17'),
    status ENUM('Release','Coming Soon')
    FOREIGN KEY (id_producer) REFERENCES producer(id)
)
```
***

**15.Tạo bảng trailer**
```sql
CREATE TABLE trailer(
    id INT PRIMARY KEY,
    id_film INT NOT NULL,
    video_trailer TEXT NOT NULL,
    FOREIGN KEY (id_film) REFERENCES film(id)
)
```
---

**16.Tạo bảng phim_format**
```sql
CREATE TABLE film_format(
    id_film INT NOT NULL,
    FOREIGN KEY (id_film) REFERENCES film(id),
    id_format INT NOT NULL,
    FOREIGN KEY (id_format) REFERENCES format(id),
    PRIMARY KEY (id_film, id_format)
```
***

**17.Tạo bảng phim_thể loại**
```sql
CREATE TABLE  film_category(
    id_film INT NOT NULL,
    id_category INT NOT NULL,
    FOREIGN KEY (id_film) REFERENCES film(id),
    FOREIGN KEY (id_category) REFERENCES category(id),
    PRIMARY KEY(id_film, id_category)
)
```
---

**18.Tạo bảng phim_diễn viên**
```sql
CREATE TABLE  film_actor(
    id_film INT NOT NULL,
    id_actor INT NOT NULL,
    FOREIGN KEY (id_film) REFERENCES film(id),
    FOREIGN KEY (id_actor) REFERENCES actor(id),
    PRIMARY KEY(id_film, id_actor)
)
```
---

**19.Tạo bảng phòng chiếu**
```sql
CREATE TABLE room(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
)
```
***

**20.Tạo bảng vị trí ghế**
```sql
CREATE TABLE seat(
    id INT PRIMARY KEY,
    id_room INT NOT NULL,
    seat_number INT NOT NULL,
    seat_row TEXT NOT NULL,
    status ENUM('Empty','Served'),
    FOREIGN KEY (id_room) REFERENCES room(id)
)
```
***

**21.Tạo bảng loại vé**
```sql
CREATE TABLE ticket_type(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    price BIGINT NOT NULL
)
```
***

**22.Tạo bảng discount**
```sql
CREATE TABLE discount (
    id INT PRIMARY KEY,
    discount FLOAT 
)
```
***

**23.Tạo bảng vé**
```sql
CREATE TABLE ticket (
    id INT PRIMARY KEY,
    id_employee INT NOT NULL,
    id_customer INT NOT NULL,
    id_film INT NOT NULL,
    id_room INT NOT NULL,
    id_seat INT NOT NULL,
    cinema_address TEXT NOT NULL,
    time_start TIME NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES employee(id),
    FOREIGN KEY (id_customer) REFERENCES customer(id),
    FOREIGN KEY (id_film) REFERENCES film(id),
    FOREIGN KEY (id_room) REFERENCES room(id),
    FOREIGN KEY (id_seat) REFERENCES seat(id)
)
```
***

**24.Tạo bảng hóa đơn khách hàng**
```sql
CREATE TABLE ticket_bill (
    id INT PRIMARY KEY,
    date_bill DATE NOT NULL,
    time_bill TIME NOT NULL,
    id_ticket INT NOT NULL,
    id_ticket_type INT NOT NULL,
    id_discount INT,
    FOREIGN KEY (id_ticket) REFERENCES ticket(id),
    FOREIGN KEY (id_ticket_type) REFERENCES ticket_type(id),
    FOREIGN KEY (id_discount) REFERENCES discount(id),
    numer_of_tickets INT NOT NULL,
    total_bill BIGINT NOT NULL
)
```
***


**25.Tạo bảng nhà cung cấp nguyên liệu**
```sql
CREATE TABLE supplier(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    bank_account_number INT NOT NULL
)
```
***

**26.Tạo bảng phiếu nhập**
```sql
CREATE TABLE import_ticket(
    id INT PRIMARY KEY,
    id_employee INT NOT NULL,
    id_supplier INT NOT NULL,
    import_date DATE NOT NULL,
    imported_money BIGINT NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES employee(id),
    FOREIGN KEY (id_supplier) REFERENCES supplier(id)
)
```
***

**27.Tạo bảng hàng nhập**
```sql
CREATE TABLE import_goods(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    production_date DATE NOT NULL,
    expiration_date DATE
)
```
***

**28.Tạo bảng chi tiết phiếu nhập**
```sql
CREATE TABLE detail_import_ticket(
    id_import_ticket INT NOT NULL,
    id_import_goods INT NOT NULL,
    quantity_of_goods INT NOT NULL,
    money_per_goods BIGINT NOT NULL,
    FOREIGN KEY (id_import_ticket) REFERENCES import_ticket(id),
    FOREIGN KEY (id_import_goods) REFERENCES import_goods(id)
)
```
***

**29.Tạo bảng menu**
```sql
CREATE TABLE menu (
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    type ENUM('Drink','Popcorn','Snacks')
    price BIGINT NOT NULL
)
```
***

**30.Tạo bảng hóa đơn ăn uống**
```sql
CREATE TABLE bill (
    id INT PRIMARY KEY,
    id_employee INT NOT NULL,
    bill_date DATE NOT NULL,
    discount FLOAT NOT NULL,
    bill_money BIGINT NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES employee(id)
)
```
***

**31.Tạo bảng chi tiết hóa đơn ăn uống**
```sql
CREATE TABLE detail_bill (
    id INT PRIMARY KEY,
    id_bill INT NOT NULL,
    id_menu INT NOT NULL,
    number_of_menu INT NOT NULL,
    FOREIGN KEY (id_bill) REFERENCES bill(id)
    FOREIGN KEY (id_menu) REFERENCES menu(id)
)
```
***    

## **Thêm Data**
**1.Thêm data bảng employee**
```sql
insert into employee (id, name, date_of_birth, gender, address, mobile, email, position) values  (1,'Thái','2000-01-01','Male','Hà Nội',01234567899,'thai@gmail.com','Vé VIP');
insert into employee (id, name, date_of_birth, gender, address, mobile, email, position) values (2,'Khải','2000-02-02','Male','Hà Nội',01234568899,'khai@gmail.com','Dịch Vụ');
insert into employee (id, name, date_of_birth, gender, address, mobile, email, position) values (3,'Cường','2000-03-03','Male','Hà Nội',01234566899,'cuong@gmail.com','Dọn Bàn');
insert into employee (id, name, date_of_birth, gender, address, mobile, email, position) values (4,'Dung','2000-04-04','Female','Hà Nội',01233567899,'dung@gmail.com','Soát Vé');
insert into employee (id, name, date_of_birth, gender, address, mobile, email, position) values (5,'Hương','2000-05-05','Female','Hà Nội',01222567899,'huong@gmail.com','Soát Vé');
```
**2.Thêm data bảng ca làm việc**
```sql
insert into shift (id, shift_type, start, end, month, salary_per_day) values (1, 'Morning', '8:00 AM', '13:00 AM', '1', 100000);
insert into shift (id, shift_type, start, end, month, salary_per_day) values (2, 'Afternoon', '13:00 AM', '17:00 AM', '1', 100000);
insert into shift (id, shift_type, start, end, month, salary_per_day) values (3, 'Night', '17:00 AM', '22:00 AM', '1', 120000);
insert into shift (id, shift_type, start, end, month, salary_per_day) values (4, 'Full-time', '8:00 AM', '5:00 AM', '1', 150000);
```
**3.Thêm data bảng lương thưởng**
```sql
insert into bonus (id, name, bonus_money) values(1, 'Tăng ca', 70000);
insert into bonus (id, name, bonus_money) values(2, 'Nhân viên xuất sắc nhất tháng', 500000 );
insert into bonus (id, name, bonus_money) values(3, 'Làm ngày lễ', 100000);
insert into bonus (id, name, bonus_money) values();
insert into bonus (id, name, bonus_money) values();
```

**4.Thêm data bảng lương phạt**
```sql
insert into punish (id, name, punish_money) values(1, 'Đi làm muộn', 50000);
insert into punish (id, name, punish_money) values(2, 'Nghỉ làm không có lý do', 70000);
insert into punish (id, name, punish_money) values(3, 'Làm hỏng thiết bị quầy vé', 3000000);
insert into punish (id, name, punish_money) values(4, 'Làm hỏng thiết bị quầy nước', 5000000);
insert into punish (id, name, punish_money) values(5, 'Dọn dẹp chuẩn bị suất chiếu chậm', 100000);

```

**5.Thêm data bảng nhân viên_lương thưởng**
```sql
insert into employee_bonus(id, id_employee, id_bonus, bonus_number, bonus_date, total_bonus_money) values(1, 1, 1, 3,'2000-01-05, 2000-01-07, 2000-01-10', 210000);
insert into employee_bonus(id, id_employee, id_bonus, bonus_number, bonus_date, total_bonus_money) values(2, 2, 1, 2,'2000-01-11, 2000-01-15', 140000);
insert into employee_bonus(id, id_employee, id_bonus, bonus_number, bonus_date, total_bonus_money) values(3, 3, 2, 1, '2021-01-01', 500000);
insert into employee_bonus(id, id_employee, id_bonus, bonus_number, bonus_date, total_bonus_money) values(4, 4, 3, 1,'2000-01-01', 100000);
insert into employee_bonus(id, id_employee, id_bonus, bonus_number, bonus_date, total_bonus_money) values(5, 5, , , ,'');
```

**6.Thêm data bảng nhân viên_lương phạt**
```sql
insert into employee_punish(id, id_employee, id_punish, punish_number, punish_date, total_punish_money) values(1, 1, 1, 2,'2000-01-15, 2000-01-17', 100000);
insert into employee_punish(id, id_employee, id_punish, punish_number, punish_date, total_punish_money) values(2, 2, 2, 1,'2000-01-10', 70000);
insert into employee_punish(id, id_employee, id_punish, punish_number, punish_date, total_punish_money) values(3, 3, 5, 1,'2000-01-01', 100000);
insert into employee_punish(id, id_employee, id_punish, punish_number, punish_date, total_punish_money) values(4, 4, , ,'');
insert into employee_punish(id, id_employee, id_punish, punish_number, punish_date, total_punish_money) values(5, 5, 1, 1,'2000-01-07', 50000);
```

**7.Thêm data bảng lương cơ bản**
```sql
insert into salary(id, id_employee, id_shift, shift_number, salary_per_month) values (1, 1, 1, 25, 2500000);
insert into salary(id, id_employee, id_shift, shift_number, salary_per_month) values (2, 2, 2, 20, 2000000);
insert into salary(id, id_employee, id_shift, shift_number, salary_per_month) values (3, 3, 3, 21, 2520000);
insert into salary(id, id_employee, id_shift, shift_number, salary_per_month) values (4, 4, 4, 26, 3900000);
insert into salary(id, id_employee, id_shift, shift_number, salary_per_month) values (5, 5, 1, 28, 2800000);
```

**8.Thêm data bảng tổng lương tháng**
```sql
insert into full_salary(id_salary, id_employee_bonus, id_employee_punish, month, total_salary) values(1, 1, 1, '1',2610000);
insert into full_salary(id_salary, id_employee_bonus, id_employee_punish, month, total_salary) values(2, 2, 2, '1',2070000);
insert into full_salary(id_salary, id_employee_bonus, id_employee_punish, month, total_salary) values(3, 3, 3, '1', 2920000);
insert into full_salary(id_salary, id_employee_bonus, id_employee_punish, month, total_salary) values(4, 4, 4, '1', 4000000);
insert into full_salary(id_salary, id_employee_bonus, id_employee_punish, month, total_salary) values(5, 5, 5, '1',  2750000);
```

**9.Thêm data bảng customer**
```sql
insert into customer (id,name, date_of_birth, gender, address, mobile, email) values (1, 'Colver Halksworth', '2001/11/04', 'Male', '2034 Scoville Pass', '2761142330', 'chalksworth0@domainmarket.com');
insert into customer (id, name, date_of_birth, gender, address, mobile, email) values (2, 'Carmelina Vaen', '2000/08/03', 'Male', '77 Birchwood Circle', '7221399921', 'cvaen1@theguardian.com');
insert into customer (id, name, date_of_birth, gender, address, mobile, email) values (3, 'Hieronymus Bisgrove', '1998/08/30', 'Male', '9673 Lillian Crossing', '4526552127', 'hbisgrove2@jalbum.net');
insert into customer (id, name, date_of_birth, gender, address, mobile, email) values (4, 'Glenn Meadowcraft', '1996/09/01', 'Female', '66 La Follette Drive', '8985430963', 'gmeadowcraft3@java.com');
insert into INTO customer (id, name, date_of_birth, gender, address, mobile, email) values (5, 'Beverly Kellington', '1998/06/18', 'Male', '589 Pond Road', '1696852013', 'bkellington4@google.com');
```
**10.Thêm data bảng producer**
```sql
insert into producer (id, name, address) values (1, 'Youbridge', 'Okuta');
insert into producer (id, name, address) values (2, 'Lazzy', 'Kupusina');
insert into producer (id, name, address) values (3, 'Skivee', 'Phra Phutthabat');
insert into producer (id, name, address) values (4, 'Quinu', 'Pujocucho');
insert into producer (id, name, address) values (5, 'Bluejam', 'Gubu');
```

**11.Thêm data bảng actor**
```sql
insert into actor (id, first_name, last_name) values (1, 'Bernetta', 'Tal');
insert into actor (id, first_name, last_name) values (2, 'Whitby', 'Sainsbury-Brown');
insert into actor (id, first_name, last_name) values (3, 'Novelia', 'Toor');
insert into actor (id, first_name, last_name) values (4, 'Marjorie', 'Sallings');
insert into actor (id, first_name, last_name) values (5, 'Malorie', 'Serrier');
```

**12.Thêm data bảng category**
```sql
insert into category (id, name) values (1, 'Romance');
insert into category (id, name) values (2, 'Crime');
insert into category (id, name) values (3, 'Drama');
insert into category (id, name) values (4, 'Musical');
insert into category (id, name) values (5, 'Documentary');
```

**13.Thêm data bảng format**
```sql
insert into format (id, name) values (1, '2D');
insert into format (id, name) values (2, '3D');
insert into format (id, name) values (3, 'IMAX');
insert into format (id, name) values (4, '4DX');
insert into format (id, name) values (5, 'Starium Laser');


```

**14.Thêm data bảng film**
```sql
insert into film (id, id_producer, title, director, poster, desciption, length, rating, status) values (1, 1, 'Snow White and the Huntsman', 'Dick Rosiello', '', '', 235, 'PG', 'Release');
insert into film (id, id_producer, title, director, poster, desciption, length, rating, status) values (2, 2, 'Doctor at Sea', 'Katherine Tindle', '', '', 138,'G', 'Release');
insert into film (id, id_producer, title, director, poster, desciption, length, rating, status) values (3, 3, 'Great Day in the Morning', 'Sheela Whittlesea', '', '', 137, 3, 'Coming Soon');
insert into film (id, id_producer, title, director, poster, desciption, length, rating, status) values (4, 4, 'My Summer of Love', 'Orelle Arrundale', '', '', 263, 'G', 'Release');
insert into film (id, id_producer, title, director, poster, desciption, length, rating, status) values (5, 'R', 'Deal, The', 'Dina Cossem', '', '', 263, 'NC-17', 'Coming Soon');
```

**15.Thêm data bảng trailer**
```sql
insert into trailer (id, id_film, video_trailer) value(1, 1, '');
insert into trailer (id, id_film, video_trailer) value(2, 2, '');
insert into trailer (id, id_film, video_trailer) value(3, 3, '');
insert into trailer (id, id_film, video_trailer) value(4, 4, '');
insert into trailer (id, id_film, video_trailer) value(5, 5, '');
```

**16.Thêm data bảng phim_format**
```sql
insert into film_format (id_film, id_format) values (1, 1);
insert into film_format (id_film, id_format) values (2, 2);
insert into film_format (id_film, id_format) values (3, 3);
insert into film_format (id_film, id_format) values (4, 4);
insert into film_format (id_film, id_format) values (5, 5);
```

**17.Thêm data bảng phim_thể loại**
```sql
insert into film_category (id_film, id_category) values (1, 1);
insert into film_category (id_film, id_category)  values (2, 2);
insert into film_category (id_film, id_category)  values (3, 3);
insert into film_category (id_film, id_category)  values (4, 4);
insert into film_category (id_film, id_category)  values (5, 5);
```

**18.Thêm data bảng phim_diễn viên**
```sql
insert into film_actor (id_film, id_actor) values (1, 1);
insert into film_actor (id_film, id_actor) values (2, 2);
insert into film_actor (id_film, id_actor) values (3, 3);
insert into film_actor (id_film, id_actor) values (4, 4);
insert into film_actor (id_film, id_actor) values (5, 5);
```
**19.Thêm data bảng phòng chiếu**
```sql
insert into room (id, name) values (1, 'Turquoise');
insert into room (id, name) values (2, 'Mauv');
insert into room (id, name) values (3, 'Pink');
insert into room (id, name) values (4, 'Green');
insert into room (id, name) values (5, 'Yellow');
```

**20.Thêm data bảng vị trí ghế**
```sql
insert into seat (id, id_room, seat_number, seat_row, status) values (1, 1, 14, 'A', 'Served');
insert into seat (id, id_room, seat_number, seat_row, status) values (2, 2, 7, 'G', 'Served');
insert into seat (id, id_room, seat_number, seat_row, status) values (3, 3, 20, 'D', 'Served');
insert into seat (id, id_room, seat_number, seat_row, status) values (4, 4, 17, 'E', 'Served');
insert into seat (id, id_room, seat_number, seat_row, status) values (5, 5, 11, 'D', 'Served');
insert into seat (id, id_room, seat_number, seat_row, status) values (6, 5, 15, 'D', 'Empty');
```

**21.Thêm data bảng loại vé**
```sql
insert into ticket_type (id, name, price) values (1, 'Normal', 50000);
insert into ticket_type (id, name, price) values (2, 'VIP', 70000);
insert into ticket_type (id, name, price) values (3, 'Couple', 160000);
insert into ticket_type (id, name, price) values (4, 'Kid', 40000);
insert into ticket_type (id, name, price) values (5, 'Elder', 40000);
```

**22.Thêm data bảng discount**
```sql
insert into discount (id, discount) values(1, 5%);
insert into discount (id, discount) values(2, 10%);
insert into discount (id, discount) values(3, 15%);
insert into discount (id, discount) values(4, 20%);
insert into discount (id, discount) values(5, 0%);
```

**23.Thêm data bảng vé**
```sql
insert into seat (id, id_employee, id_customer, id_film, id_room, id_seat, cinema_address, time_start) values (1, 1, 1, 1, 1, 1, '40601 Melrose Avenue', '5:07 AM');
insert into seat (id, id_employee, id_customer, id_film, id_room, id_seat, cinema_address, time_start) values (2, 2, 2, 2, 2, 2, '6 Everett Avenue', '10:03 AM');
insert into seat (id, id_employee, id_customer, id_film, id_room, id_seat, cinema_address, time_start) values (3, 3, 3, 3, 3, 3, '37567 Leroy Parkway', '5:07 PM');
insert into seat (id, id_employee, id_customer, id_film, id_room, id_seat, cinema_address, time_start) values (4, 4, 4, 4, 4, 4, '426 Logan Road', '1:24 PM');
insert into seat (id, id_employee, id_customer, id_film, id_room, id_seat, cinema_address, time_start) values (5, 5, 5, 5, 5, 5, '38228 Becker Lane', '12:25 PM');
```
**24.Thêm data bảng hóa đơn khách hàng**
```sql
insert into ticket_bill (id, date_bill, time_bill, id_ticket, id_ticket_type, id_discount, number_of_ticket, total_bill) values (1, '4/17/2021', '6:43 PM', 1, 1, 1, 10, '$3.68');
insert into ticket_bill (id, date_bill, time_bill, id_ticket, id_ticket_type, id_discount, number_of_ticket, total_bill) values (2, '3/13/2021', '1:42 AM', 2, 2, 2, 1, '$5.64');
insert into ticket_bill (id, date_bill, time_bill, id_ticket, id_ticket_type, id_discount, number_of_ticket, total_bill) values (3, '6/8/2021', '4:01 AM', 3, 3, 3, 5, '$0.27');
insert into ticket_bill (id, date_bill, time_bill, id_ticket, id_ticket_type, id_discount, number_of_ticket, total_bill) values (4, '11/25/2021', '9:28 PM', 4, 4, 4, 9, '$0.52');
insert into ticket_bill (id, date_bill, time_bill, id_ticket, id_ticket_type, id_discount, number_of_ticket, total_bill) values (5, '8/8/2021', '4:07 PM', 5, 5, 5, 5, '$8.73');
```

**25.Thêm data bảng supplier**
```sql
insert into supplier (id, name, address, mobile, bank_account_number) values (1, 'Muxo', 'Trâu Quỳ', 03109115900, 9875703656);
insert into supplier (id, name, address, mobile, bank_account_number) values (2, 'Livetube', 'Domalanoan', 00229736876, 0114701075);
insert into supplier (id, name, address, mobile, bank_account_number) values (3, 'Gigazoom', 'Keda', 05285651436, 4309821707);
insert into supplier (id, name, address, mobile, bank_account_number) values (4, 'Tagchat', 'Couva', 03870836467, 2777467447);
insert into supplier (id, name, address, mobile, bank_account_number) values (5, 'Jabbersphere', 'Trollhättan', 07576765818, 3169428047);
```

**26.Thêm data bảng import_ticket**
```sql
insert into import_ticket (id, id_employee, id_supplier, import_date, imported_money) values (1, 1, 1, '2022/01/18', 2613168);
insert into import_ticket (id, id_employee, id_supplier, import_date, imported_money) values (2, 2, 2, '2022/01/01', 7441084);
insert into import_ticket (id, id_employee, id_supplier, import_date, imported_money) values (3, 3, 3, '2022/01/15', 2629232);
insert into import_ticket (id, id_employee, id_supplier, import_date, imported_money) values (4, 4, 4, '2022/02/20', 6365957);
insert into import_ticket (id, id_employee, id_supplier, import_date, imported_money) values (5, 5, 5, '2022/02/18', 5020170);
```

**27.Thêm data bảng import_goods**
```sql
insert into import_goods (id, name, production_date, expiration_date) values (1, 'Cốc', '2019/07/21', '12/24/2021');
insert into import_goods (id, name, production_date, expiration_date) values (2, 'Ống hút', '2019/07/12', '6/15/2021');
insert into import_goods (id, name, production_date, expiration_date) values (3, 'Bắp', '2019/07/17', '2/16/2021');
insert into import_goods (id, name, production_date, expiration_date) values (4, 'Coca', '2019/06/28', '7/22/2021');
insert into import_goods (id, name, production_date, expiration_date) values (5, 'Bơ thực vật', '2019/03/20', '3/10/2021');
```

**28.Thêm data bảng detail_import_ticket**
```sql
insert into detail_import_ticket (id_import_ticket, id_import_goods, quanty_of_goods, money_per_goods) values (1, 1, 96, 721276);
insert into detail_import_ticket (id_import_ticket, id_import_goods, quanty_of_goods, money_per_goods) values (2, 2, 85, 646220);
insert into detail_import_ticket (id_import_ticket, id_import_goods, quanty_of_goods, money_per_goods) values (3, 3, 44, 102076);
insert into detail_import_ticket (id_import_ticket, id_import_goods, quanty_of_goods, money_per_goods) values (4, 4, 99, 555624);
insert into detail_import_ticket (id_import_ticket, id_import_goods, quanty_of_goods, money_per_goods) values (5, 5, 26, 638148);
```

**29.Thêm data bảng menu**
```sql
insert into menu (id, name, type, price) values (1, 'Bỏng ngô Caramel', 'Popcorn', 50000);
insert into menu (id, name, type, price) values (2,'Coca', 'Drink', 30000);
insert into menu (id, name, type, price) values (3, 'Snack Bò nướng', 'Snacks', 25000);
insert into menu (id, name, type, price) values (4, 'Đậu Phộng', 'Snacks', 25000);
insert into menu (id, name, type, price) values (5, 'Milo', 'Drink', 30000);
```
**30.Thêm data bảng bill**
```sql
insert into bill (id, id_employee, bill_date, discount, bill_money) values (1, 1, 15%, '2020/05/22', 150000);
insert into bill (id, id_employee, bill_date, discount, bill_money) values (2, 2, 10%, '2020/03/02', 659000);
insert into bill (id, id_employee, bill_date, discount, bill_money) values (3, 3, 10%, '2020/04/30', 868000);
insert into bill (id, id_employee, bill_date, discount, bill_money) values (4, 4, 20%, '2020/05/02', 959000);
insert into bill (id, id_employee, bill_date, discount, bill_money) values (5, 5, 10%, '2020/04/19', 950000);
```

**31.Thêm data bảng detail_bill**
```sql
insert into detail_bill (id, id_bill, id_menu, number_of_menu) values (1, 1, 1, 5);
insert into detail_bill (id, id_bill, id_menu, number_of_menu) values (2, 2, 2, 8);
insert into detail_bill (id, id_bill, id_menu, number_of_menu) values (3, 3, 3, 6);
insert into detail_bill (id, id_bill, id_menu, number_of_menu) values (4, 4, 4, 10);
insert into detail_bill (id, id_bill, id_menu, number_of_menu) values (5, 5, 5, 6);
```