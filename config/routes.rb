Rails.application.routes.draw do
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/edit'
  get 'contact',  to:'pages#contact'
  get 'about',  to:'pages#about'
  get 'error',  to:'pages#error'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :task, except: [:index], controller: 'projects/tasks'
  end

  root 'pages#home'

  get '*path', to: redirect("/error")
end
