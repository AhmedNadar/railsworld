Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'pages#home'

  get 'pages/home', as: 'home'
  get 'pages/about', to: 'pages#about', as: 'about'
  get 'pages/contact', as: 'contact'
  get 'pages/toronto', as: 'toronto'
  get 'pages/framework', as: 'framework'
  get 'pages/people', as: 'people'
  get 'pages/conf', as: 'conf'
end


