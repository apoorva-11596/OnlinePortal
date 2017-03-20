Rails.application.routes.draw do
  
  devise_scope :user do
    get "/auth/facebook/callback" => "omniauth_callbacks#facebook"
    #get "/users/auth/facebook" => "users_omniauth_callbacks#passthru", as: "user_facebook_omniauth_authorize"
    post "/auth/facebook?model=user" => "callbacks#passthru", as: "user_facebook_omniauth_authorize"
  end

  devise_scope :student do
    get "/auth/facebook/callback" => "omniauth_callbacks#facebook"
    #get "/students/auth/facebook" => "students_omniauth_callbacks#passthru", as: "student_facebook_omniauth_authorize"
    post "/auth/facebook?model=student" => "callbacks#passthru", as: "student_facebook_omniauth_authorize"
  end
  devise_for :students, controllers: {registrations: "students/registrations", sessions: "students/sessions", confirmations: "students/confirmations", passwords: "students/passwords"}
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", confirmations: "users/confirmations", passwords: "users/passwords"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'extras#home'

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
