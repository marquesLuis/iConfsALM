IConfs::Application.routes.draw do

  get "user/maps"

  match '/newAdmin' => 'admin#new', :as => 'new_admin'   # new administrator

  post 'administrator' => 'admin#create'

  post 'administrators' => 'admin#create'

  delete 'administrator.:id' => 'admin#destroy' # destroy an administrator

  namespace :administrator do
    root :to => 'admin#adminhome'     # sign_in next page
  end

  get "user/notifications"

  get 'administrators' => 'admin#index'
  
  devise_for :administrators

  get "user/program"

  post "/devise/singup/do"

  post "singup/do"

  get "singup/show"

  resources :locations

  namespace :registry do
    root :to => 'home#index'
  end

  devise_for :registries, :controllers => {:registrations => "registrations"}

  devise_for :registries

  devise_for :administrators

  root :to => 'user#program'

  resources :rejected_contacts


  resources :pending_contacts


  resources :area_of_interests


  resources :removed_notifications


  resources :networkings


  resources :org_notifications

  resources :program_versions
  
  resources :event_groups do
    resources :events
  end

  resources :documents


  resources :authors


  resources :speakers


  resources :infos


  resources :contacts


  resources :people


  resources :notes


  resources :removed_notes


  resources :messages


  resources :feedbacks


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
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'


  #

end
