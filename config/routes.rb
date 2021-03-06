ChinaBeiBao::Application.routes.draw do
  devise_for :admins,
    :controllers => { :sessions => 'admins/sessions', :registrations => "admins/registrations" }
    
  root :to => "home#index"
  
  namespace :admin do
    root :to => 'home#index'
    resources :companies do
      resources :topics
      resources :articles
      resources :routes
    end
    resources :areas, :topics, :articles, :routes, :admins
  end
  
  
  resources :topics, :routes, :articles, :companies, :only => [:index, :show]
  match '/:slug' => 'areas#show', :as => :area
  match '/:slug/topics' => 'topics#index', :as => :area_topics
  match '/:slug/articles' => 'articles#index', :as => :area_articles
  match '/:slug/routes' => 'routes#index', :as => :area_routes  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        # 
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
