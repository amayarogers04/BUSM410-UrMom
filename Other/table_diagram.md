# CP1 and CP2 Table Diagram

This diagram shows the tables and joins used by CP1 and the CP2 analysis table.

```dbml
Table products {
  id int [pk]
  category string
  department string
  brand string
}

Table users {
  id int [pk]
  age int
}

Table order_items {
  id int [pk]
  user_id int
  product_id int
  delivered_at timestamp
  returned_at timestamp
  sale_price numeric
}

Ref: order_items.product_id > products.id
Ref: order_items.user_id > users.id
```

Fields are from the team schema export; Brylle confirmed `users.id` and `users.age`. The executed CP2 table uses a left join to users to preserve the order-item row unit. Query 13 found no unmatched users among its 27,307 rows.
