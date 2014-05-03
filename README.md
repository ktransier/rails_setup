## Rails 4 Setup
+ Create new app (rails new myapp --database=postgresql)

#### Postgres Setup
+ (cp rails_4_setup/database_example.yml myapp/config)
+ (cp rails_4_setup/database_example.yml myapp/config/database.yml)
+ Change database to correct database name in database.yml
+ Change username to myusername in database.yml
+ in psql: (CREATE DATABASE myapp_development;)
+ in psql: (CREATE DATABASE myapp_test;

#### Gemfile
+ Add Gemfile (cp rails_4_setup/Gemfile highpraise/)
+ (bundle)

#### Test Server
+ (rails s)
+ (http://localhost:8080/)

#### Unicorn
+ Readme (https://devcenter.heroku.com/articles/rails-unicorn)
+ Add Procfile (cp rails_4_setup/Procfile myapp/)
+ Add Unicorn.rb to config (cp rails_4_setup/unicorn.rb highpraise/config)

#### Bootstrap
+ Run Bootstrap gem generator (rails generate bootstrap:install static)

#### Font Awesome
+ Add (*= require font-awesome) to application.css

#### Devise
+ (rails g model user)
+ (rake db:migrate)
+ (rails generate devise:install)
+ (rails generate devise user)
+ add to config/environments/development.rb (config.action_mailer.default_url_options = { host: 'localhost', port: 3000 })
+ (rails generate devise:views)
+ (cp -r rails_4_setup/devise myapp/app/view/devise)
+ Readme (https://github.com/plataformatec/devise#getting-started)

#### Routes
(cp rails_4_setup/routes.rb highpraise/config/routes.rb)

#### Constants
+ Add constants.rb to config (cp rails_4_setup/constants.rb myapp/config)

#### Secret Token
(cp rails_4_setup/secret_token.rb myapp/config/initializers/secret_token.rb)

#### Standard application.haml, css and js
(cp rails_4_setup/application.haml myapp/app/views/layouts)
(rm highpraise/app/views/layouts/application.html.erb)
(cp rails_4_setup/main.css.scss myapp/app/assets/stylesheets)
(cp rails_4_setup/main.js myapp/app/assets/javascripts)

#### Heroku Setup
+ (cp rails_4_setup/heroku_env_example.rb myapp/config/)
+ (cp highpraise/config/heroku_env_example.rb highpraise/config/heroku_env.rb)
+ Generate new Rails key and copy to heroku_env.rb (rake secret)
+ Generate new Devise key and copy to heroku_env.rb (rake secret)
+ (cp rails_4_setup/newrelic.yml myapp/config)

#### Git
+ (cp rails_4_setup/.gitignore myapp/)
+ (git init)
+ (git add .)
+ (git commit -m "init")
+ (git remote add origin git@github.com:ktransier/myapp.git)
+ (git push -u origin master)

#### Heroku
+ (heroku create)
+ (git push heroku master)
+ (heroku rename myapp)
+ (heroku addons:add pgbackups:auto-month)
+ (heroku addons:add mailgun)
+ (heroku addons:add newrelic)
+ (heroku open)
