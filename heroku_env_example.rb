# This is an example file containing the necessary environment variables for
# running the app locally. Copy all below into a new heroku_env.rb file.

################

# This file contains the ENV vars necessary to run the app locally.
# Some of these values are sensitive, and some are developer specific.

# DO NOT CHECK THIS FILE INTO VERSION CONTROL

ENV['SECRET_KEY_BASE'] = 'foo'
ENV['DEVISE_SECRET_KEY'] = 'foo'
