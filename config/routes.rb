Rails.application.routes.draw do
  resources :user_avatars, only: [:create]
  resources :deny_reasons
  resources :messages
  resources :reasons
  resources :insurances
  resources :standards
  resources :items
  resources :contracts
  resources :users
  get 'user/technicians',  to: 'users#technicians'
  get 'user/customers',  to: 'users#customers'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'auth#login'
  post 'auth/reset_password', to: 'auth#reset_password'
  post 'service/request_repair', to: 'services#request_repair'
  get 'service/create_services', to: 'services#create_services'
  get 'service/open_services', to: 'services#open_services'
  post 'service/complete_service', to: 'services#complete_service'
  post 'service/deny_service', to: 'services#deny_service'
  get 'services', to: 'services#index'
  get 'services/:id', to: 'services#show'
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/denied', to: 'dashboard#denied_services'
  post 'dashboard/assign_user', to: 'dashboard#assign_user'
  get 'dashboard/chart', to: 'dashboard#chart'
  get 'dashboard/contracts', to: 'dashboard#contracts'
  get 'dashboard/pusher', to: 'dashboard#pusher'
end
