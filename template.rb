# http://guides.rubyonrails.org/rails_application_templates.html

gem 'devise'
gem 'slim-rails'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'pry'
end

environment 'config.action_mailer.default_url_options = {host: "localhost", port: 3000}', env: 'production'

initializer "generators.rb", <<END.strip_heredoc
  Rails.application.class.configure do
    config.generators do |g|
      g.test_framework :rspec
      g.template_engine :slim
      g.view_specs false
      g.helper false
      g.helper_specs false
      g.stylesheets false
      g.javascripts false
    end
  end
END

generate(:scaffold, "page")
route "root to: 'pages#index'"