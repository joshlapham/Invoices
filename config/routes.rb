Rails.application.routes.draw do

  root 'users#index'

  get 'login', :to => 'sessions#login'
  get 'logout', :to => 'sessions#logout'

  # NOTE: this should be last, and taken out in production
  match ':controller(/:action(/:id))', :via => [:get, :post]

end
