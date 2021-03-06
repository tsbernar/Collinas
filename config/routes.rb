Rails.application.routes.draw do
  get '/cart' => 'carts#show', :as => 'cart'
  post '/add_to_cart/:menu_item_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  post '/increase_qty/:cart_item_id' => 'cart_items#increase_qty', :as => 'increase_qty'
  post '/decrease_qty/:cart_item_id' => 'cart_items#decrease_qty', :as => 'decrease_qty'

  resources :orders
  get '/checkout' => 'orders#checkout', as: :checkout
  post '/checkout' => 'orders#checkout'
  get '/order_info' => 'orders#new'
  post '/braintree' => 'orders#braintree', as: :braintree

  resources :cart_items
  devise_for :users
  devise_scope :user do
     get "admin", to: "devise/sessions#new"
  end
  resources :menu_items do
    collection do
      post :import
    end
  end

  get "/upload" => "menu_items#upload"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'pages#home'
  get "/" => "pages#home"
  get "/about" => "pages#about"
  get "/contact_us" => "pages#contact_us"
  get "/dashboard" => "pages#dashboard"
  get "/settings" => "pages#settings"
  get "/terms" => "pages#terms_of_use"
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
