Ausleihe::Application.routes.draw do
  get "attachment/new"

  get "attachment/create"

  get "attachment/destroy"

  devise_for :users

  resources :lendings

  resources :entleihers
  
  resources :attachments

  get "buches/search", :to => "buches#search", :as => "search_buches"

  get "buches/advanced_search", :to => "buches#advanced_search", :as => "advanced_search_buches"

  get "buches/openlibrary", :to => "buches#openlibrary", :as => "openlibrary_buches"
  get "buches/google_books", :to => "buches#google_books", :as => "google_books_buches"
  get "buches/nacsis", :to => "buches#nacsis", :as => "nacsis_buches"
  resources :buches

  put "lendings/return/:id",:to =>  "lendings#return", :as => "return_lending"
  
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # 
  # just remember to delete public/index.html.
     root :to => "buches#search"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
