Rails.application.routes.draw do
 

  root 'dashboard#show'

  namespace :admin do
  
    root 'businesses#index'
    resources :offers

    resources :ibeacons

    resources :stores

    resources :businesses

    resources :setting_contents
  end

  namespace :business do
    root 'users#index'
  end

  get 'terms' => 'dashboard#show_terms'
  get 'about' => 'dashboard#show_about_us'
  # mount Ckeditor::Engine => '/ckeditor'
  

  #devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  namespace :api, :defaults => {:format => 'json'} do
    scope :module => :v1 do
      namespace :indorse do
        post 'login'  => 'sessions#create', :as => :login
        get  'logout/:authentication_token' => 'sessions#destroy', :as => :logout
        post  'forgot_password' => 'passwords#create', :as => :forgot_password
        post  'change_password' => 'passwords#change_password', :as => :change_password
        post 'sign_up' => "users#sign_up",:as => :signup
        post 'update_notification' => "users#update_notification",:as => :update_notification
        get  'setting_content/:content_id' => 'users#setting_contents', :as  => :setting_content
        post 'near_by_store_list' => "stores#near_by_store_list",:as => :near_by_store_list
        post 'complete_task' => "offers#complete_task",:as => :complete_task
        post 'add_visits' => "offers#add_visits",:as => :add_visits
      end
    end
  end
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
