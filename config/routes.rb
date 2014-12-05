Rails.application.routes.draw do

  resources :categories
  # get '/categories' => 'categories#index'
  # post '/categories' => 'assign_category#create'
  # get '/categories/new' => 'assign_category#new'
  # get '/categories/:id/edit' => 'categories#edit'
  # get '/categories/:id' => 'categories#show'
  # patch '/categories/:id' => 'categories#update'
  # put '/categories/:id' => 'categories#update'
  # delete '/categories/:id' => 'categories#destroy'

  get '/assign_categories' => 'assign_category#new'
  post '/assign_categories' => 'assign_category#create'

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :comments

  resources :answers

  resources :questions

  root to: 'home#index'

  get 'admin' => 'admin#index'

  post 'vote' => 'vote#vote'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
