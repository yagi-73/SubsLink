Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :admin do
    get 'companies/search' => 'companies#search'
    resources :companies, only: [:index, :create, :show, :update, :destroy]
    get 'subscriptions/search' => 'subscriptions#search'
    get 'subscriptions/change-form' => 'subscriptions#change_form'
    resources :subscriptions, only: [:index, :create, :show, :update, :destroy]
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
    resources :subscriptions, only: [:index, :create, :show, :update, :destroy]
    post 'subscriptions/subscribe' => 'subscriptions#subscribe', as: 'subscribe'
    delete 'subscriptions/unsubscribe/:id' => 'subscriptions#unsubscribe', as: 'unsubscribe'
    resources :companies, only: [:index, :show]
  end
end
