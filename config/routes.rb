IConfs::Application.routes.draw do

  get "user_search/notes_search"

  get "user_search/networking_search"

  get "user_search/events_search"

  get "user_search/people_search"

  get "user_search/search"

  post "user_program/remove_event"

  post "user_program/add_event"

  get "notes/export"

  get "notes/edit_on_event"

  post "notes/create_on_event"

  get "notes/index_on_event"

  post "notes/destroy_on_event"

  get "notes/edit_on_event"

  get "notes/show_on_event"

  get "notes/new_on_event"

  get "user/download_document"

  get "user_program/show_event"

  get "user_program/index"

  post "notes/destroy_on_participant"

  post "notes/update_on_participant"

  post "notes/create_on_participant"

  get "notes/edit_on_participant"

  get "notes/show_on_participant"

  get "notes/new_on_participant"

  get "notes/index_on_participant"

  get "user_program/show_complete"

  get "user_contacts/export"

  post "user_networking/show"

  post "user_networking/delete"

  post "user_networking/create"

  get "user_networking/new"

  post "user_networking/show_selection"

  get "user_networking/index"

  post "update/update"

  get "update/login"

  post "user_profile/update_biography"

  post "user_profile/update_interests"

  post "user_profile/upload_photo"

  get "user_profile/show"

  get "user/show_rejected_contacts"

  post "user_contacts/reject_request"

  post "user_contacts/accept_request"

  get "user_contacts/show_pending_contact"

  post "user_contacts/send_request"

  resources :event_documents


  resources :documents


  post "user/organization_message"

  get "user/show_participant"

  get "user/show_all_participants"

  get "user/show_pending_contacts"

  get "user/show_contacts"

  post "user/feedback"

  get "user/organization"

  get "user/maps"

  resources :event_groups do
    resources :events
  end


 # get "user/program"
  match '/newAdmin' => 'admin#new', :as => 'new_admin'
  post 'administrator' => 'admin#create'
  post 'administrators' => 'admin#create'
  get "user/notifications"

  get "user/program"

  delete 'administrator.:id' => 'admin#destroy'
  get 'administrators' => 'admin#index'
  
  get 'administrator.:id' => 'admin#show'

  devise_for :administrators

  namespace :administrator do
    root :to => 'admin#adminhome'
  end



  get "admin/adminhome"
  #get "admin/new"



  post "/devise/singup/do"

  post "singup/do"

  get "singup/show"

  resources :locations

  namespace :registry do
    root :to => 'update#login'
  end

  devise_for :registries, :controllers => {:registrations => "registrations"}

  devise_for :registries

  devise_for :administrators

  root :to => 'user#program'

  resources :rejected_contacts


  resources :pending_contacts


  resources :area_of_interests


  resources :networkings


  resources :org_notifications

  match '/maps_versions' => 'maps_versions#index'
  get 'maps_versions/index'


  resources :program_versions

  resources :authors


  resources :speakers


  resources :infos


  resources :contacts


  resources :people


  resources :notes


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
