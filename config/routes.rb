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
    resources :companies, only: [:new, :create, :edit, :update, :destroy]
    resources :subscriptions, only: [:new, :create, :edit, :update, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end
    resources :subscriptions
    resources :companies, only: [:index, :show]
    post 'subscriptions/subscribe/:id' => 'subscriptions#subscribe', as: 'subscribe'
  end
end
