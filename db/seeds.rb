# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


mall_mart = Shop.create(name: 'Mall Mart')
products = Product.new([{name: 'Hat', price: 10.99, shop: mall_mart }, {name: 'White T-Shirt', price: 14.99, shop: mall_mart }, {name: 'Trash Bin', price: 2.99, shop: mall_mart }])
line_items = LineItem.new([{product: products.first, quantity: 5 }, {product: products.second, quantity: 1 }, {product: products.second, quantity: 10 }, {product: products.last, quantity: 1 }])
orders = Order.new([{line_items: [line_items.first, line_items.second] }, {line_items: [line_items.first, line_items.second, line_items.last] }])



