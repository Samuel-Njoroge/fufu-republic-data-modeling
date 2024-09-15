CREATE TABLE "payment_method_dim"(
    "payment_method_key" VARCHAR(255) NOT NULL,
    "payment_method_name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "payment_method_dim" ADD PRIMARY KEY("payment_method_key");
CREATE TABLE "menu_item_dim"(
    "menu_item_key" VARCHAR(255) NOT NULL,
    "item_name" VARCHAR(255) NOT NULL,
    "category" VARCHAR(255) NOT NULL,
    "standard_price" FLOAT(53) NOT NULL,
    "is_standard" BOOLEAN NOT NULL
);
ALTER TABLE
    "menu_item_dim" ADD PRIMARY KEY("menu_item_key");
CREATE TABLE "cutomer_dim"(
    "customer_key" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email_address" VARCHAR(255) NOT NULL,
    "phone_number" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "cutomer_dim" ADD PRIMARY KEY("customer_key");
CREATE TABLE "sales_fact"(
    "order_item_id" VARCHAR(255) NOT NULL,
    "date_key" INTEGER NOT NULL,
    "branch_key" INTEGER NOT NULL,
    "customer_key" INTEGER NOT NULL,
    "menu_item_key" INTEGER NOT NULL,
    "payment_method_key" INTEGER NOT NULL,
    "order_type_key" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "sales_amount" INTEGER NOT NULL
);
ALTER TABLE
    "sales_fact" ADD PRIMARY KEY("order_item_id");
CREATE TABLE "date_dim"(
    "date_key" INTEGER NOT NULL,
    "full_date" DATE NOT NULL,
    "year" INTEGER NOT NULL,
    "quarter" INTEGER NOT NULL,
    "month" INTEGER NOT NULL,
    "day" INTEGER NOT NULL,
    "day_of_week" INTEGER NOT NULL
);
ALTER TABLE
    "date_dim" ADD PRIMARY KEY("date_key");
CREATE TABLE "branch_dim"(
    "branch_key" VARCHAR(255) NOT NULL,
    "branch_name" VARCHAR(255) NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    "branch_type" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "branch_dim" ADD PRIMARY KEY("branch_key");
CREATE TABLE "order_type_dim"(
    "order_type_key" VARCHAR(255) NOT NULL,
    "order_type_name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "order_type_dim" ADD PRIMARY KEY("order_type_key");
ALTER TABLE
    "sales_fact" ADD CONSTRAINT "sales_fact_customer_key_foreign" FOREIGN KEY("customer_key") REFERENCES "cutomer_dim"("customer_key");
ALTER TABLE
    "sales_fact" ADD CONSTRAINT "sales_fact_menu_item_key_foreign" FOREIGN KEY("menu_item_key") REFERENCES "menu_item_dim"("menu_item_key");
ALTER TABLE
    "sales_fact" ADD CONSTRAINT "sales_fact_date_key_foreign" FOREIGN KEY("date_key") REFERENCES "date_dim"("date_key");
ALTER TABLE
    "sales_fact" ADD CONSTRAINT "sales_fact_branch_key_foreign" FOREIGN KEY("branch_key") REFERENCES "branch_dim"("branch_key");
ALTER TABLE
    "sales_fact" ADD CONSTRAINT "sales_fact_order_type_key_foreign" FOREIGN KEY("order_type_key") REFERENCES "order_type_dim"("order_type_key");
ALTER TABLE
    "sales_fact" ADD CONSTRAINT "sales_fact_payment_method_key_foreign" FOREIGN KEY("payment_method_key") REFERENCES "payment_method_dim"("payment_method_key");
