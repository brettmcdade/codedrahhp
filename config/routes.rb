Codedrahhp::Application.routes.draw do
  
# resources :mediafiles                                                                                                                                                                            
# resources :digitalfiles
#  resources :users
 resources :profile 
 

  #get \"users\/show\"

  root :to => "home#index"

  devise_for :users, :path_names => { :sign_up => "register" }, :controllers => { :registrations => "registrations" }


# Creates http://salmonchase.me/username
#  get "/:id", :to => "users#show", :as => "user"
  
#resources :users do
 # resources :digitalfiles
#end

resources :users do
  resources :mediafiles, :except => [:update, :edit]
end

 # dont think I need match '/mediafiles/:uuid' => 'mediafiles#show', :via => :get
  
 
  Codedrahhp::Application.routes.draw do
  # match 'digitalfiles/:id/:style.:format', :controller => 'digitalfiles', :action => 'download', :conditions => { :method => :get }
  match 'mediafiles/:uuid/:style.:format', :controller => 'mediafiles', :action => 'download', :conditions => { :method => :get }
    
end   


 
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
  # match ':controller(/:action(/:id(.:format)))'
  
  match ':controller/:id/:action'
end
