## Rails 4 Setup
+ Create new app (rails new myapp --database=postgresql)
+ (cd myapp)

#### Gemfile
+ Add Gemfile (cp ../rails_4_setup/Gemfile .)
+ (rm Gemfile.lock)
+ (bundle)

#### Postgres Setup
+ Change database to correct database name in database.yml
+ Copy database.yml and rename database-example.yml
+ in psql: (CREATE DATABASE myapp_development;)
+ in psql: (CREATE DATABASE myapp_test;)

#### [Unicorn](https://devcenter.heroku.com/articles/rails-unicorn)
+ Add Procfile (cp ../rails_4_setup/Procfile .)
+ Add Unicorn.rb to config (cp ../rails_4_setup/unicorn.rb ./config)
+ (rails s) Navigate to http://localhost:8080/

#### Devise
+ (rails g model user)
+ (rake db:migrate)
+ (rails generate devise:install)
+ (rails generate devise user)
+ (rake db:migrate)
+ add to config/environments/development.rb (config.action_mailer.default_url_options = { host: 'localhost', port: 3000 })
+ (rails generate devise:views)
+ (rm -r ./app/views/devise)
+ (cp -r ../rails_4_setup/devise ./app/views)
+ Add (config.secret_key = ENV['DEVISE_SECRET_KEY']) to devise initializer
+ Readme (https://github.com/plataformatec/devise#getting-started)

#### Setup initial pages controller
+ (rails g controller pages home)
+ (cp ../rails_4_setup/home.haml ./app/views/pages/)
+ (rm ./app/views/pages/home.html.erb)

#### Routes
+ (cp ../rails_4_setup/routes.rb ./config/routes.rb)

#### Constants
+ Add constants.rb to config (cp ../rails_4_setup/constants.rb ./config)

#### Heroku Setup
+ (cp ../rails_4_setup/secret_token.rb ./config/initializers/secret_token.rb)
+ (cp ../rails_4_setup/heroku_env_example.rb ./config/)
+ (cp ./config/heroku_env_example.rb ./config/heroku_env.rb)
+ Generate new Rails key and copy to heroku_env.rb (rake secret)
+ Generate new Devise key and copy to heroku_env.rb (rake secret)
+ (cp ../rails_4_setup/newrelic.yml ./config)
+ (cp ../rails_4_setup/environment.rb ./config/environment.rb)

#### Standard application.haml, css and js
+ (cp ../rails_4_setup/application.haml ./app/views/layouts)
+ (rm ./app/views/layouts/application.html.erb)
+ (cp ../rails_4_setup/main.css.scss ./app/assets/stylesheets)
+ (cp ../rails_4_setup/main.js ./app/assets/javascripts)
+ Run Bootstrap gem generator (rails generate bootstrap:install static)
+ Add (*= require font-awesome) to application.css
+ Remove (//= require turbolinks) from application.js

#### Git
+ (cp ../rails_4_setup/.gitignore .)
+ (git init)
+ (git add .)
+ (git commit -m "init")
+ (git remote add origin git@github.com:ktransier/wookeyjack.git)
+ (git push -u origin master)

#### Heroku
+ (heroku create)
+ (git push heroku master)
+ (rake secret)
+ (heroku config:set SECRET_KEY_BASE= )
+ (rake secret)
+ (heroku config:set DEVISE_SECRET_KEY= )
+ (heroku rename wookeyjack)
+ (heroku addons:add pgbackups:auto-month)
+ (heroku addons:add newrelic)
+ Setup availability pinging (https://coderwall.com/p/u0x3nw)
+ (heroku run rake db:migrate)
+ (heroku open)

If need to add or update SSH keys: heroku keys:add ~/.ssh/id_rsa.pub 

#### Mailgun
+ (heroku addons:add mailgun)
Add to production.rb -
```
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
```
