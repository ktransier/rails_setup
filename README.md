### Initial Commands
+ (rails new myapp --database=postgresql)
+ add 'host: localhost' to database.yml
+ change username to myusername in database.yml
+ in psql: (CREATE DATABASE myapp_development;)
+ in psql: (CREATE DATABASE myapp_test;
+ to test setup (rails s)
+ (git init)
+ (git add .)
+ (git commit -m "init")
+ (git remote add origin git@github.com:ktransier/myapp.git)
+ (git push -u origin master)
+ heroku create
+ git push heroku master
+ heroku rename myapp
+ heroku open

### Standard Gemfile

+ source 'https://rubygems.org'

+ ruby '2.0.0'
+ gem 'rails', '4.0.0'

+gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml'
gem 'rails_12factor', group: :production
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'haml'
gem 'pg_search'
gem 'rabl'
gem 'pry'
gem 'jsonify-rails'


