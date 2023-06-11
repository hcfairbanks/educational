Rails.application.routes.draw do
  resources :users do
    post 'login', action: 'login'
  end

  resources :sessions, only: [:create, :new, :destroy]

  # resources :users do
  #   member do
  #     post '/reset_login_attempts', action:'reset_login_attempts'
  #     get '/serve_small',  action: 'serve_small'
  #     get '/serve_medium', action: 'serve_medium'
  #     get '/serve_large',  action: 'serve_large'
  #   end
  # end











  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
