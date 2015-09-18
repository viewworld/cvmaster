Rails.application.routes.draw do
 
 
  get 'pdf/download'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
 devise_for :admins
 
 get 'users/client' => 'users#client'

 get 'delete_user' => 'users#delete_user'

 get 'delete_sum' => 'users#delete_sum'
 get 'delete_tech' => 'users#delete_tech'
 get 'delete_skill' => 'users#delete_skill'
 get 'delete_project' => 'users#delete_project'
 get 'delete_job' => 'users#delete_job'
 get 'delete_language' => 'users#delete_language'
 put 'client_update' => 'users#client_update'
 get 'user_thanks' => 'users#user_thanks'

 get 'from_podio' => 'users#from_podio'
 get '/header' => 'pdf#header'
 get '/footer' => 'pdf#footer'
 get '/pdf_to_podio' => 'pdf#pdf_to_podio'
 resources :users
  # You can have the root of your site routed with "root"
   root 'users#index'

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
