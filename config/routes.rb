BookShare::Application.routes.draw do
  get "pages/home"     #Custom route for home action
  get "log_out" => "sessions#destroy", :as => "log_out"    #Custom route for log_out
  match "/users/:user_id/books/new" => "books#create", via: [:post]

  resources :pages, :only => [:home]
  resources :users do
    resources :books
  end
  resources :catalog, :only => [:index]
  resource :session, :only => [:new, :create, :destroy]
  resources :carts,   :only => [:create, :destroy]
  resources :line_items,  :only => [:create]

  namespace :api, :only => [:index, :show, :create, :update, :destroy], :defaults => {:format => :xml} do
    #any routes defined here will be prefixed with /api
    #and controller will be defined under the /api/.. Api:: module
     resources :users
  end

  root :to => "sessions#new"

end
