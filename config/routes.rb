Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}, controllers: { registrations: "user_registrations" }
  resources :users
  resources :products do
    resources :comments
  end

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'simple_pages/landing_page'
  get 'products', to: 'products#index'
  post 'simple_pages/thank_you'
  post 'payments/create'
  root 'simple_pages#landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders, only: [:index, :show, :create, :destroy]

  mount ActionCable.server => '/cable'
end
