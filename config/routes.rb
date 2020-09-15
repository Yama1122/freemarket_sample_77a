Rails.application.routes.draw do
  devise_for :users
  root to:'products#index'
  resources :products, only: [:index,:show,:new] do
    member do
      get 'confirmation'
    end
  end
  
  resources :users, only: :show do
    member do
      get 'logout'
    end
    collection do
      get 'registration_select'
      get 'complete'
    end
  end

  resources :categories, only: [:index,:show] do
    collection do
      get :search
    end
  end
  
  resources :credit_cards, only: :new
  resources 'searches', only: :index
end
