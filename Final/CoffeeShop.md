## **Tạo Database**
```sql
CREATE DATABASE CoffeeShop
```
***

**1.Tạo bảng nhân viên**
```sql
CREATE TABLE employee(
    id VARCHAR(5) PRIMARY KEY,
    name TEXT NOT NULL,
    date DATE NOT NULL,
    gender ENUM ('Male', 'Female'),
    address TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    position TEXT NOT NULL,
    username TEXT NOT NULL,
    password VARCHAR(5) NOT NULL
)
```
***

**2.Tạo bảng ca làm việc**
```sql
CREATE TABLE shift(
    id VARCHAR(5) PRIMARY KEY,
    name TEXT NOT NULL,
    start TIME NOT NULL,
    end TIME NOT NULL, 
    month ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'),
    salary_per_day BIGINT NOT NULL
)
```
***

**3.Tạo bảng lương**
```sql
CREATE TABLE salary(
    id VARCHAR(5) PRIMARY KEY,
    id_employee VARCHAR(5) NOT NULL,
    id_shift VARCHAR(5) NOT NULL,
    shift_number INT NOT NULL,
    salary BIGINT NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES employee(id),
    FOREIGN KEY (id_shift) REFERENCES shift(id)
)
```
***

**4.Tạo bảng thưởng**
```sql
CREATE TABLE bonus(
	id VARCHAR(5) PRIMARY KEY,
    reason_bonus TEXT NOT NULL,
    bonus BIGINT NOT NULL
)
```
***

**5.Tạo bảng phạt**
```sql
CREATE TABLE punish(
	id VARCHAR(5) PRIMARY KEY,
    reason_punish TEXT NOT NULL,
    punish BIGINT NOT NULL
)
``` 
***

**6.Tạo bảng lương_thưởng**
```sql
CREATE TABLE salary_bonus(
	id VARCHAR(5) PRIMARY KEY,
    id_salary VARCHAR(5) NOT NULL,
    id_bonus VARCHAR(5),
    bonus_number INT,
    bonus_date TEXT,
    total_bonus_money BIGINT,
    FOREIGN KEY (id_salary) REFERENCES salary(id),
    FOREIGN KEY (id_bonus) REFERENCES bonus(id) 
)
```

**7.Tạo bảng lương_phạt**
```sql
CREATE TABLE salary_punish(
	id VARCHAR(5) PRIMARY KEY,
    id_salary VARCHAR(5) NOT NULL,
    id_punish VARCHAR(5),
    punish_number INT,
    punish_date TEXT,
    total_punish_money BIGINT,
    FOREIGN KEY (id_salary) REFERENCES salary(id),
    FOREIGN KEY (id_punish) REFERENCES punish(id) 
)
```

**8.Tạo bảng khách hàng**
```sql
CREATE TABLE customer(
    id VARCHAR(5) PRIMARY KEY,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM ('Male', 'Female'),
    mobile VARCHAR(11) NOT NULL,
    email TEXT NOT NULL
)
```
***

**9.Tạo bảng nhà cung cấp**
```sql
CREATE TABLE supplier(
    id VARCHAR(5) PRIMARY KEY,
    name TEXT NOT NULL,
    CEO TEXT NOT NULL,
    address TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    email TEXT NOT NULL,
    bank_account_number INT NOT NULL
)
```
***

**10.Tạo bảng phiếu nhập**
```sql
CREATE TABLE import_ticket(
    id VARCHAR(5) PRIMARY KEY,
    id_employee VARCHAR(5) NOT NULL,
    id_supplier VARCHAR(5) NOT NULL,
    import_date DATE NOT NULL,
    imported_money BIGINT NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES employee(id),
    FOREIGN KEY (id_supplier) REFERENCES supplier(id)
)
```
***

**11.Tạo bảng nguyên liệu nhập**
```sql
CREATE TABLE ingredient(
    id VARCHAR(5) PRIMARY KEY,
    name TEXT NOT NULL,
    unit TEXT NOT NULL,
    production_date DATE NOT NULL,
    expiration_date DATE
)
```
***

**12.Tạo bảng chi tiết phiếu nhập**
```sql
CREATE TABLE detail_import_ticket(
    id VARCHAR(5) PRIMARY KEY, 
    id_import_ticket VARCHAR(5) NOT NULL,
    id_ingredient VARCHAR(5) NOT NULL,
    quantity_of_goods INT NOT NULL,
    money_per_goods BIGINT NOT NULL,
    FOREIGN KEY (id_import_ticket) REFERENCES import_ticket(id),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id)
)
```
***

**13.Tạo bảng nhóm hàng**
```sql
CREATE TABLE ingredient_type(
    id VARCHAR(5) PRIMARY KEY,
    name TEXT NOT NULL
)
```
***    

**14.Tạo bảng mặt hàng**
```sql
CREATE TABLE item (
    id VARCHAR(5) PRIMARY KEY,
    id_ingredient_type VARCHAR(5) NOT NULL,
    name TEXT NOT NULL,
    type ENUM('Tea','Coffee','Milk Tea','Cake','Snacks'),
    image TEXT,
    price BIGINT NOT NULL,
    FOREIGN KEY (id_ingredient_type) REFERENCES ingredient_type(id)
)
```
***

**15.Tạo bảng mặt hàng_nguyên liệu**
CREATE TABLE item_ingredient (
    id_item VARCHAR(5) NOT NULL,
    id_ingredient VARCHAR(5) NOT NULL,
    FOREIGN KEY (id_item) REFERENCES item(id),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id),
    PRIMARY KEY(id_item, id_ingredient)
)
```
***

**16.Tạo bảng bàn phục vụ**
```sql
CREATE TABLE table_service (
    id VARCHAR(5) PRIMARY KEY,
    name TEXT NOT NULL,
    status ENUM('Empty','Serviced','Not Yet Serviced')
)
```
***

**17.Tạo bảng discount**
```sql
CREATE TABLE discount (
    id VARCHAR(5) PRIMARY KEY,
    name TEXT NOT NULL,
    discount FLOAT NOT NULL
)
```
***

**18.Tạo bảng hóa đơn**
```sql
CREATE TABLE bill (
    id VARCHAR(5) PRIMARY KEY,
    id_customer VARCHAR(5),
    id_employee VARCHAR(5) NOT NULL,
    id_table_service VARCHAR(5) NOT NULL,
    bill_date DATE NOT NULL,
    id_discount VARCHAR(5),
    bill_money BIGINT NOT NULL,
    FOREIGN KEY (id_customer) REFERENCES customer(id),
    FOREIGN KEY (id_discount) REFERENCES discount(id),
    FOREIGN KEY (id_employee) REFERENCES employee(id),
    FOREIGN KEY (id_table_service) REFERENCES table_service(id)
)
```
***

**19.Tạo bảng chi tiết hóa đơn**
```sql
CREATE TABLE detail_bill (
    id VARCHAR(5) PRIMARY KEY,
    id_bill VARCHAR(5) NOT NULL,
    id_item INT NOT NULL,
    amount INT NOT NULL,

    FOREIGN KEY (id_item) REFERENCES item(id),
    FOREIGN KEY (id_bill) REFERENCES bill(id)
)
```
***


