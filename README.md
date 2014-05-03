## Rails 4 Setup
+ Create new app (rails new myapp --database=postgresql)
+ (cd myapp)

#### Gemfile
+ Add Gemfile (cp rails_4_setup/Gemfile myapp/)
+ (rm Gemfile.lock)
+ (bundle)

#### Postgres Setup
+ (cp rails_4_setup/database_example.yml myapp/config)
+ (cp rails_4_setup/database_example.yml myapp/config/database.yml)
+ Change database to correct database name in database.yml
+ Change username to myusername in database.yml
+ in psql: (CREATE DATABASE myapp_development;)
+ in psql: (CREATE DATABASE myapp_test;)

#### Unicorn
+ Readme (https://devcenter.heroku.com/articles/rails-unicorn)
+ Add Procfile (cp rails_4_setup/Procfile myapp/)
+ Add Unicorn.rb to config (cp rails_4_setup/unicorn.rb myapp/config)

#### Test Server
+ (rails s)
+ (http://localhost:8080/)

#### Devise
+ (rails g model user)
+ (rake db:migrate)
+ (rails generate devise:install)
+ (rails generate devise user)
+ (rake db:migrate)
+ add to config/environments/development.rb (config.action_mailer.default_url_options = { host: 'localhost', port: 3000 })
+ (rails generate devise:views)
+ (rm -r myapp/app/views/devise)
+ (cp -r rails_4_setup/devise myapp/app/views)
+ Add (config.secret_key = ENV['DEVISE_SECRET_KEY']) to devise initializer
+ Readme (https://github.com/plataformatec/devise#getting-started)

#### Setup initial pages controller
+ (rails g controller pages home)
+ (cp rails_4_setup/home.haml myapp/app/views/pages/)
+ (rm myapp/app/views/pages/home.html.erb)


#### Routes
+ (cp rails_4_setup/routes.rb myapp/config/routes.rb)

#### Constants
+ Add constants.rb to config (cp rails_4_setup/constants.rb myapp/config)

#### Heroku Setup
+ (cp rails_4_setup/secret_token.rb myapp/config/initializers/secret_token.rb)
+ (cp rails_4_setup/heroku_env_example.rb myapp/config/)
+ (cp myapp/config/heroku_env_example.rb myapp/config/heroku_env.rb)
+ Generate new Rails key and copy to heroku_env.rb (rake secret)
+ Generate new Devise key and copy to heroku_env.rb (rake secret)
+ (cp rails_4_setup/newrelic.yml myapp/config)
+ (cp rails_4_setup/environment.rb myapp/config/environment.rb)

#### Standard application.haml, css and js
+ (cp rails_4_setup/application.haml myapp/app/views/layouts)
+ (rm myapp/app/views/layouts/application.html.erb)
+ (cp rails_4_setup/main.css.scss myapp/app/assets/stylesheets)
+ (cp rails_4_setup/main.js myapp/app/assets/javascripts)
+ Run Bootstrap gem generator (rails generate bootstrap:install static)
+ Add (*= require font-awesome) to application.css
+ Remove (//= require turbolinks) from application.js

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
+ (rake secret)
+ (heroku config:set SECRET_KEY_BASE= )
+ (rake secret)
+ (heroku config:set DEVISE_SECRET_KEY= )
+ (heroku rename myapp)
+ (heroku addons:add pgbackups:auto-month)
+ (heroku addons:add newrelic)
+ Setup availability pinging (https://coderwall.com/p/u0x3nw)
+ (heroku open)

#### Mailgun
+ (heroku addons:add mailgun)
Add to production.rb -

  config.action_mailer.default_url_options = { host: " " }

  ActionMailer::Base.smtp_settings = {
    :port           => ENV['MAILGUN_SMTP_PORT'],
    :address        => ENV['MAILGUN_SMTP_SERVER'],
    :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
    :password       => ENV['MAILGUN_SMTP_PASSWORD'],
    :domain         => " ",
    :authentication => :plain,
  }
  ActionMailer::Base.delivery_method = :smtp
