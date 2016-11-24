# == Route Map
#
#       Prefix Verb   URI Pattern                 Controller#Action
#      lessons GET    /lessons(.:format)          lessons#index
#              POST   /lessons(.:format)          lessons#create
#   new_lesson GET    /lessons/new(.:format)      lessons#new
#  edit_lesson GET    /lessons/:id/edit(.:format) lessons#edit
#       lesson GET    /lessons/:id(.:format)      lessons#show
#              PATCH  /lessons/:id(.:format)      lessons#update
#              PUT    /lessons/:id(.:format)      lessons#update
#              DELETE /lessons/:id(.:format)      lessons#destroy
#       groups GET    /groups(.:format)           groups#index
#              POST   /groups(.:format)           groups#create
#    new_group GET    /groups/new(.:format)       groups#new
#   edit_group GET    /groups/:id/edit(.:format)  groups#edit
#        group GET    /groups/:id(.:format)       groups#show
#              PATCH  /groups/:id(.:format)       groups#update
#              PUT    /groups/:id(.:format)       groups#update
#              DELETE /groups/:id(.:format)       groups#destroy
#   main_index GET    /main/index(.:format)       main#index
# main_contact GET    /main/contact(.:format)     main#contact
#         root GET    /                           main#index
#                     /resque                     #<Resque::Server app_file="/home/meysam/.rvm/gems/ruby-2.3.0/gems/resque-1.22.0/lib/resque/server.rb">
#

require 'resque/server'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'cms/groups'
      get 'cms/lessons/:id' => 'cms#lessons'
    end
  end

  resources :lessons
  resources :groups
  resources :headwords
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

  get 'main/index'
  get 'main/contact'
  post 'main/search'
  root 'main#index'
  
  mount Resque::Server.new, at: "/resque"
  

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
