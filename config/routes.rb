Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_for :hosts

  root 'pages#home'
  get '/menu', to: 'pages#menu'
  get '/order', to: 'pages#order'
  get '/contact', to: 'pages#contact'

  resources :users do
    member do
      get :confirmation_token
    end
  end
  resources :listings, only: [:show] do
  resources :orders do
    get 'success'
    get 'cancel'
    get 'payment_details'
  end
end

  resources :stripes, only: [:create]

  namespace :platform do
    get '/home', to: 'pages#host_homepage'

    resources :dashboards, only: [:show]
    resources :hosts
    resources :listings do
      member do
        delete :delete_photo_attachment
      end
    end
  end
end
