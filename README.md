== MyBlogger Application

* Ruby version: 1.9.3 or 2.0

* Rails version: 4.0.2

* Configuration
  - bundle install

* Database creation
  
  - Use database_sample.yaml to create database.yaml and update database credentials. 
  - rake db:migrate

* Apllication Secret Token
  
  - Use secret_token_sample.rb to create secret_token.rb and update secret_key 

* Deployment instructions
  - rails server