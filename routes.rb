RightsApi::Application.routes.draw do
  authenticated :user do
    root "", as: :authenticated_root
  end

  unauthenticated do
    root to: ""
  end

  if Rails.env == 'production'
    devise_for :users, :controllers => { :registrations => "registrations" }
  else
    devise_for :users
  end

  resources :users
end
