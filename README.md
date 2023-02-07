# README
## Welcome to the The Museum of Curious Ancient Archeological Artifacts ##
Prepare to be amazed with all the strange and unique artifacts we have on display!

Before you can enter; however, please follow the steps below: 
1. Ensure you have **Ruby 2.7.4** and **Rails 5.2.8.1**
1. In the terminal type `bundle install`
1. Then type `rails db:create`, then `rails db: migrate`, and then `rails db: seed` 
1. Then type `rails server`
1. In your brower navigate to `http://localhost:3000/`
1. Look through the site, click on links, and try to update/create new artifacts & exhibits!
1. Now, back in the terminal type `control C` to exit the server
1. Then type `bundle exec rspec spec/models` to see all model tests passing
1. Then type `bundle exec rspec spec/features` to see all feature tests passing
1. If you'd like to see a webpage of the SimpleCove test coveraage: 
    - In the terminal type `bundle exec rspec` and then `open coverage/index.html`

## A Visual Diagram of the Current Schema ##
![Ancient Archeo Museum Diagram](https://user-images.githubusercontent.com/116964982/217344550-6a4bfbd5-e1b9-4acb-b5d2-43b98354253e.png)

<!-- This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
