Rails.application.routes.draw do

  root 'users#index'

  resources :invoices, :clients

  get '/invoices/:id/delete', :to => 'invoices#delete'
  get '/clients/:id/delete', :to => 'clients#delete'

  get 'login', :to => 'sessions#login'
  get 'logout', :to => 'sessions#logout'

  # NOTE: this should be last, and taken out in production
  #match ':controller(/:action(/:id))', :via => [:get, :post]

end
