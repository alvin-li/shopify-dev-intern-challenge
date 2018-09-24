# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shop.delete_all
mall_mart, wall_mart = Shop.create!([{ name: 'Mall Mart' }, { name: 'Wall Mart' }])
mall_mart_order, wall_mart_order = Order.create!([{ shop: mall_mart }, { shop: wall_mart}])
products = Product.create!([{
    name: 'Hat',
    price: 10.99,
    shop: mall_mart
    }, {
    name: 'White T-Shirt',
    price: 14.99,
    shop: mall_mart
    }, {
    name: 'Trash Bin',
    price: 2.99,
    shop: wall_mart
    }])
LineItem.create!([{
    product: products.first,
    order: mall_mart_order,
    quantity: 3
    }, {
    product: products.second,
    order: mall_mart_order,
    quantity: 2
    }, {
    product: products.last,
    order: wall_mart_order,
    quantity: 10
    }, {
    product: products.last,
    order: wall_mart_order,
    quantity: 1
    }])


