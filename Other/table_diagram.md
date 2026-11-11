# CP1 Table Diagram

This DBML diagram shows the tables used in the CP1 analysis.

```dbml
Table products {
  id int [pk]
  category string
  department string
}

Table order_items {
  id int [pk]
  product_id int
  delivered_at timestamp
  returned_at timestamp
  sale_price numeric
}

Ref: order_items.product_id > products.id
```

Fields and keys are from the schema export provided by the team. The join is the one used in project queries. The mature-cohort check found no unmatched product IDs or duplicate order-item IDs; it does not establish full-dataset integrity.
