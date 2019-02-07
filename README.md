## Shopify's Winter 2019 Developer Intern Challenge

A Rails based server-side web API that models a simple shop

<a href="https://docs.google.com/document/d/1YYDRf_CgQRryf5lZdkZ2o3Hm3erFSaISL1L1s8kLqsI/edit">Questions and Instructions</a>

<a href="https://docs.google.com/document/d/1kbPeylXh_9iF4ReXwLd2wvkK_iIcUnctoqFlVjOhPig/edit">My Thought Process/Workflow

### Requirements
`Ruby 2.3.3`
`Rails 5.2.1`

### Getting Started

1. Clone the repository and navigate to it
2. Install the gems with `bundle install`
3. Migrate the database with `rake db:migrate` and seed it with `rake db:setup`
4. Run `rails server` to run the server at `localhost:3000`
5. Visit `localhost:3000/api/v1/shops` and you should see the json for the two seeded shops
6. Test out CRUD operations for every model by sending requests to `localhost:3000/api/v1`!

### API Reference

These are the params for updating/creating each model:
 - Shops should have a name (`Shop.create!(name: 'Mall Mart')`)
 - Orders must belong to a Shop (`Order.create!(shop: Shop.first)`)
 - Products must have a name, a price greater than zero, and must belong to a Shop (`Product.create!(name: 'Jeans', price: 39.99, shop: Shop.first)`)
 - Line Items must have a quantity, and must belong to both an Order and a product (`LineItem.create!(quantity: 2, product: Product.first, order: Order.first)`)
 
### Potential Improvements

There are still a ton of ways to extend the base functionality, such as:
 - adding product variants for line items 
 - writing methods to calculate revenue over time
 - building out views to help navigate the API
 
 This server also has zero security. Even just adding a public key which is stored in a .env file would be a good start.
 
 I read up on the documents regarding GKE, Docker, and Kubernetes and attempted to deploy my project to a Kubernetes environment but was unsuccessful.
