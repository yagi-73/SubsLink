Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

  namespace :admin do
    get 'companies/search' => 'companies#search'
    resources :companies, only: [:index, :create, :show, :update, :destroy]
    get 'subscriptions/search' => 'subscriptions#search'
    resources :subscriptions, only: [:index, :create, :update, :destroy]
    resources :categories, only: [:index, :create, :update, :destroy]
  end

  scope module: :public do
    authenticated :user do
      root to: 'users#show', as: :authenticated_root
    end
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :users, only: [:show, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'relationships' => 'users#index'
      get 'search' => 'users#search'
    end
    get 'subscriptions/search' => 'subscriptions#search'
    resources :subscriptions, only: [:index, :create, :update, :destroy]
    post 'subscriptions/subscribe' => 'subscriptions#subscribe', as: 'subscribe'
    resources :companies, only: [:index, :show]
  end
end
