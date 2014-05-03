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

source 'https://rubygems.org'

ruby '2.1.1'
gem 'rails', '4.1.0'
gem 'pg', '0.17.1'
gem 'unicorn', '4.8.2'
gem 'devise', '3.2.4'

gem 'haml'
gem 'jquery-rails'
gem 'pg_search'
gem 'rabl'
gem 'sass-rails', '~> 4.0.0'
gem 'select2-rails'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn-rails'
gem 'will_paginate'
gem 'will_paginate-bootstrap'

group :development, :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'rspec-rails', '3.0.0.beta2'
  gem 'rspec-its'

end

group :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

### Standard application.haml

!!!
%html
  %head
    %title MyApp
    = stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true
    = javascript_include_tag "application", "data-turbolinks-track" => true
    = csrf_meta_tags
    %link{:href=>"//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css", :rel=>"stylesheet"}
    %link{href: "//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css", rel: "stylesheet"}
  %body
    = yield

