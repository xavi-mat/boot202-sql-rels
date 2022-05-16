# boot202-sql-rels

Exercise: Create Database and Relationships

https://classroom.google.com/u/0/c/NDgwNDYwMTI2OTAz/a/NTE0OTI2NTkxNjU0/details

## 2. Create and use DB

### 2.1. Create schema

* Users, Products, Orders and Categories
* Needed a Details table for the many to many relationship between Products and
Orders

![Diagram](./doc/21.png)

![Execution](./doc/21b.png)

### 2.2. Execute queries

#### 2.2.1. Insert data
* new users
![](./doc/221a.png)

* new categories (order changed because we need to insert categories **before**
products)
![](./doc/221d.png)

* new products
![](./doc/221d.png)

* new orders (inserted orders **and** details)
![](./doc/221c.png)

#### 2.2.2. Update data
* change name of one product by id
![](./doc/222a.png)

* change price of one product (we update the product **and** the details with
that product)
![](./doc/222b.png)


#### 2.2.3. Get data
![](./doc/223a.png)

![](./doc/223b.png)

![](./doc/223c.png)

![](./doc/223d.png)

![](./doc/223d2.png)

![](./doc/223e.png)

![](./doc/223f.png)

![](./doc/223f2.png)


## 3. Extra

### 3.1. Delete data
* Trying to delete a product will trigger an constraint error, because that
product is referenced as FK in the table `details`.
![](./doc/31.png)

* We need to delete the referencing line **before** deleting the product.
![](./doc/31b.png)


### 3.2. Update schema
* Add new table `reviews`.

![](./doc/32.png)

![](./doc/32b.png)


### 3.3. Execute queries
* Add new reviews.

#### 3.3.1. Insert data
![](./doc/331.png)

#### 3.3.2. Update data
![](./doc/332.png)

#### 3.3.3. Get data
* Get all reviews
![](./doc/333a.png)

* Get all products, with their reviews
![](./doc/333b.png)
We understand that **all products** implies a `LEFT JOIN`.

* Another example, with average ratings.
![](./doc/333b2.png)

* Get a product with its reviews
![](./doc/333c.png)

* Get products with category and reviews
![](./doc/333d.png)
We choose, again, a `LEFT JOIN`.

* A user and their orders with details
![](./doc/333e.png)

#### 3.3.4. Delete data

* Delete a review by `id`.
In this BD, the reviews have no `id`. They are referenced as PK by the
combination `(user_id,product_id)`.

But it's easy to add an `id` (the exercise never says that it **must be** a PK).

And then, use the `id` to delete a review.

![](./doc/334.png)
