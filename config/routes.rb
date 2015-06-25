School::Application.routes.draw do

  post 'stripe/webhook'
  get '/pricing', to: 'adverts#pricing', as: 'pricing'
  get 'adverts/:id/show_advert', to: 'adverts#show_advert', as: 'show_advert'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get '/sign_up', to: 'users/registrations#new', as: :sign_up
    get '/sign_in', to: 'devise/sessions#new', as: :sign_in
    get '/:id/edit', to: 'users/registrations#edit', as: :edit
    get '/subscription', to: 'users/registrations#subscription', as: 'subscription'
    get '/resubscription', to: 'users/registrations#resubscription'
    put 'users/change_plan', to: 'users/registrations#change_plan'
    put 'users/cancel_plan', to: 'users/registrations#cancel_plan'
    put 'users/setup_billing', to: 'users/registrations#setup_billing'
    put 'users/subscribe_customer', to: 'users/registrations#subscribe_customer'
  end
  
  resources :users, only: [:show]

  resources :adverts do
    resources :email_sellers, only: [:create, :new]
  end
  resources :photos, only: [:destroy]
  resources :contacts, only: [:create, :new]
  
  
  root 'adverts#index'



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
