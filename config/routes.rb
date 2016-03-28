Rails.application.routes.draw do
  
  
  get 'progress/index'

  get 'progress/show'

  get 'assessments/new'

  get 'assessments/create'

  get 'assessments/index'

  get 'comments/index'

  mount Ckeditor::Engine => '/ckeditor'
  get 'class_bookings/show'

  get 'class_bookings/index'

  get 'class_bookings/new'

  get 'class_bookings/create'

  get 'exercise_classes/show'

  get 'exercise_classes/index'

  

  #get 'exercise_classes/new'

  #get 'sessions/new'

  resources :users
  resources :trainers, controller: 'users', type: 'Trainer'
  resources :clients, controller: 'users', type: 'Client'

  resources :exercise_classes
  resources :articles 
  resources :comments
  resources :appointments
  resources :assessments
  resources :progress
  
  resources :class_bookings, only: [:create, :destroy]

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  root 'static_pages#home'


  get 'help'    =>  'static_pages#help'
  get 'about'   =>  'static_pages#about'
  get 'contact' =>  'static_pages#contact'
  get 'signup'  =>  'users#new'
  get 'login'   =>  'sessions#new'
  post 'login'  =>  'sessions#create'
  delete 'logout' =>  'sessions#destroy'
  get 'newclass'  =>  'exercise_classes#new'
  get 'allclasses'  =>  'exercise_classes#index'
  get 'newarticle'  =>  'articles#new'
  get 'newappointment' => 'appointments#new'
  get 'articles'  =>  'articles#index'
  get 'allappointments' => 'appointments#index'
  get 'clientprogress' => 'progress#index'

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
