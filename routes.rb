MyApp::Application.routes.draw do
  authenticated :user do
    root "pages#home", as: :authenticated_root
  end

  unauthenticated do
    root to: "pages#home"
  end

  if Rails.env == 'production'
    devise_for :users, :controllers => { :registrations => "registrations" }
  else
    devise_for :users
  end

  resources :users
end
