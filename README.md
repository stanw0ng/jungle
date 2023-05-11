# Jungle

The mini e-commerce application built with Rails 6.1 is designed to provide an excellent learning experience for students who want to learn more about the Ruby on Rails framework. The application is designed to showcase the various aspects of the framework, including how to handle databases, user authentication, payment processing, and more. By building a small e-commerce application, students can learn how to apply Ruby on Rails concepts to a real-world scenario.

The application's primary objective is to teach students how to create a functional e-commerce website using Rails. Students will learn how to create product listings, allow users to create accounts and purchase products, implement payment processing, and more. The application will also cover fundamental concepts like routing, controllers, views, and models.

The mini e-commerce application will also provide students with valuable experience in debugging and adding new features to an existing project. Students will learn how to troubleshoot issues that arise when building a web application and how to implement new features while maintaining the integrity of the codebase.
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- Turbolinks
- Bcrypt

## Testing

Integration testing with Cypress.

## Screenshots

![Landing Page]()
_Home page_

![Products]()
_Home page populated with all products_

![Empty Cart]()
_Our Cart is empty, let's do some shopping._

![Category]()
_Clicking on one of the categories will give us a filtered list of products. Clicking on an product directs us into an individual product page_

![Product Page]()

![Checkout]()
_Our cart is now ready for checkout._

![Payment]()
_Processing the payment is provided through Stripe._

![Order Summary]()
_An summary of the order is provided after payment is processed._

![Admin Privileges]()
_Admins have the ability to add new categories or products and see shop metrics in the dashboard. Let's try accessing the products and add a new product_

![Basic User Authorization]()
_Basic aser authhorization is used so that only users with login information can access the admin features._

![Admin Products]()
_Here, all the products can be seen. Users remove items from stock or add new ones._

![Add Product]()
_New products can be added to the database using this form._

## To Do

A developer's work is never finished! Here is a list of features/fixes that still need addressing in the future:

- Feature: Product Ratings
- Feature: Email Receipts





