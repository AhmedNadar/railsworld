Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'pages#home'

  get 'pages/home', as: 'home'
  get 'pages/about', as: 'about'
  get 'pages/contact', as: 'contact'
end


