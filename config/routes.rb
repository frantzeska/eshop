Rails.application.routes.draw do
  resources :products
  get 'simple_pages/about'
  get 'simple_pages/contact'
  root 'simple_pages#index'
  get '/products', to: 'products#index'
  get 'simple_pages/landing_page'
  delete '/products/:5', to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders, only: [:index, :show, :create, :destroy]
end
