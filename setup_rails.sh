!/bin/bash

rails new $1 --database=postgresql -m template.rb
cd $1
bundle

createdb $1_development;
createdb $1_test;

rails generate rspec:install

rails generate devise:install
rails generate devise user
rails db:migrate
rails generate devise:views

git init
git add .
git commit -m 'init'
git remote add origin git@github.com:ktransier/$1.git
git push -u origin master

heroku create
git push heroku master
heroku run rake db:migrate
heroku open