Ue::Application.routes.draw do
  get 'logout' => 'sessions#destroy', :as => :logout
  get 'login' => 'sessions#new', :as => :login
  post 'login' => 'sessions#create'

  resources :users
  resources :student_terms
  resources :language_proficiencies
  resources :citizenships
  resources :countries
  resources :languages
  resources :term_sessions
  
  resources :terms do
    resources :student_terms, :controller => 'terms/student_terms'
    post 'generate_sessions', :on => :member
  end

  resources :assets
  resources :ages
  resources :programs
  resources :organization_staff_types
  resources :organization_staffs
  resources :organizations
  resources :school_staff_types
  resources :school_staffs
  resources :student_relations
  resources :addresses
  resources :comments
  resources :contact_number_types
  resources :contact_numbers
  resources :student_relationship_types
  resources :student_relationships
  resources :people
  resources :grades
  resources :ethnicities
  resources :neighborhoods
  resources :states
  resources :counties
  resources :activities
  resources :schools
  resources :students do
    resources :student_terms, :controller => 'students/student_terms'
  end

  root :to => "home#index"
  
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
