CREATE TABLE "order"(
    "order_id" VARCHAR(255) NOT NULL,
    "branch_id" VARCHAR(255) NOT NULL,
    "customer_id" VARCHAR(255) NOT NULL,
    "payment_method_id" VARCHAR(255) NOT NULL,
    "order_date_time" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "order_type" VARCHAR(255) NOT NULL,
    "total_amount" INTEGER NOT NULL
);
ALTER TABLE
    "order" ADD PRIMARY KEY("order_id");
CREATE TABLE "payment_method"(
    "payment_method_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "payment_method" ADD PRIMARY KEY("payment_method_id");
CREATE TABLE "customer"(
    "customer_id" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email_address" VARCHAR(255) NOT NULL,
    "phone_number" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "customer" ADD PRIMARY KEY("customer_id");
CREATE TABLE "order_item"(
    "order_item_id" VARCHAR(255) NOT NULL,
    "order_id" VARCHAR(255) NOT NULL,
    "menu_item_id" VARCHAR(255) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "price" FLOAT(53) NOT NULL
);
ALTER TABLE
    "order_item" ADD PRIMARY KEY("order_item_id");
CREATE TABLE "branch"(
    "branch_id" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "branch" ADD PRIMARY KEY("branch_id");
CREATE TABLE "inventory"(
    "inventory_id" VARCHAR(255) NOT NULL,
    "branch_id" VARCHAR(255) NOT NULL,
    "menu_item_id" VARCHAR(255) NOT NULL,
    "quantity" INTEGER NOT NULL
);
ALTER TABLE
    "inventory" ADD PRIMARY KEY("inventory_id");
CREATE TABLE "menu_item"(
    "menu_item_id" VARCHAR(255) NOT NULL,
    "item_name" VARCHAR(255) NOT NULL,
    "category" VARCHAR(255) NOT NULL,
    "price" FLOAT(53) NOT NULL,
    "is_standard" BOOLEAN NOT NULL
);
ALTER TABLE
    "menu_item" ADD PRIMARY KEY("menu_item_id");
ALTER TABLE
    "order" ADD CONSTRAINT "order_order_id_foreign" FOREIGN KEY("order_id") REFERENCES "branch"("branch_id");
ALTER TABLE
    "payment_method" ADD CONSTRAINT "payment_method_payment_method_id_foreign" FOREIGN KEY("payment_method_id") REFERENCES "menu_item"("menu_item_id");
ALTER TABLE
    "customer" ADD CONSTRAINT "customer_first_name_foreign" FOREIGN KEY("first_name") REFERENCES "order"("order_id");
ALTER TABLE
    "branch" ADD CONSTRAINT "branch_branch_id_foreign" FOREIGN KEY("branch_id") REFERENCES "inventory"("inventory_id");
ALTER TABLE
    "order" ADD CONSTRAINT "order_branch_id_foreign" FOREIGN KEY("branch_id") REFERENCES "order_item"("order_item_id");
ALTER TABLE
    "menu_item" ADD CONSTRAINT "menu_item_menu_item_id_foreign" FOREIGN KEY("menu_item_id") REFERENCES "inventory"("inventory_id");
ALTER TABLE
    "order" ADD CONSTRAINT "order_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "menu_item"("menu_item_id");
ALTER TABLE
    "order_item" ADD CONSTRAINT "order_item_order_item_id_foreign" FOREIGN KEY("order_item_id") REFERENCES "menu_item"("menu_item_id");