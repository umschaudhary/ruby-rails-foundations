Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'contact', to: 'pages#contact'
  get 'about',  to: 'pages#about'
  get 'error',  to: 'pages#error'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :tasks, except: [:index]
  end

  root 'pages#home'

  get '*path', to: redirect("/error")
end
