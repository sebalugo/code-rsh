Rails.application.routes.draw do

  get 'courses/results'

  get 'login' => 'sessions#new' , :as => "login"
  get 'logout' => 'sessions#destroy' , :as => "logout"
  get 'practice' =>'categories#index' , :as => 'practice'
  get 'profile' =>'users#profile' , :as => 'profile'
  get 'practice/java' => 'categories#java' , :as => 'java'
  get 'practice/ruby' => 'categories#ruby' , :as => 'ruby'
  get 'practice/javascript' => 'categories#javascript' , :as => 'javascript'
  get 'practice/python' => 'categories#python' , :as => 'python'
  get 'results' => 'courses#results' , :as =>'results'
  get 'ruby_courses' => 'courses#ruby_courses' , :as => 'ruby_courses'
  get 'java_courses' => 'courses#java_courses' , :as => 'java_courses'
  get 'js_courses' => 'courses#js_courses' , :as => 'js_courses'
  get 'python_courses' => 'courses#python_courses' , :as => 'python_courses'

  get 'python_courses/practice' => 'courses#python_practice' , :as => 'python_practice'
  get 'ruby_courses/practice' => 'courses#ruby_practice' , :as => 'ruby_practice'
  get 'js_courses/practice' => 'courses#js_practice' , :as => 'js_practice'
  get 'java_courses/practice' => 'courses#java_practice' , :as => 'java_practice'

  get 'leaderboards/ruby' => 'categories#ruby_leaderboards' , :as => 'ruby_leaderboards'
  get 'leaderboards/js' => 'categories#js_leaderboards' , :as => 'js_leaderboards'
  get 'leaderboards/java' => 'categories#java_leaderboards' , :as => 'java_leaderboards'
  get 'leaderboards/python' => 'categories#python_leaderboards' , :as => 'python_leaderboards'

  get 'ruby_lobby' => 'categories#ruby_lobby' , :as => 'ruby_lobby'
  get 'js_lobby' => 'categories#js_lobby' , :as => 'js_lobby'
  get 'java_lobby' => 'categories#java_lobby' , :as => 'java_lobby'
  get 'python_lobby' => 'categories#python_lobby' , :as => 'python_lobby'

  root 'home#welcome'
  post 'users/new' => 'users#aa'
  get 'leaderboards' => 'categories#leaderboards' , :as => "leaderboards"
  get 'multiplayer' => 'match#set_match' , :as => "set_match"


  resources :users
  resources :sessions

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
