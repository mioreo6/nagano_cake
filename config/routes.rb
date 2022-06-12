Rails.application.routes.draw do

  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  namespace :public do
  resources :orders, only: [:new, :confirm, :complete, :index, :create]
  end
  namespace :public do
  resources :cart_items, only: [:index, :update, :destroy, :create, :destroy_all]
  end
  namespace :public do
  resources :items, only: [:index, :show]
  end
  namespace :public do
   resources :customers, only: [:show, :edit, :unsubscribe, :withdraw, :update]
  end
  namespace :public do
   resources :homes, only: [:top, :about]
  end
  
  namespace :admin do
   resources :orders, only: [:show, :update]
  end
  namespace :admin do
   resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :items, except: [:destroy, :update]
    patch 'item/:id' => 'items#update', as: 'update_item'
  end
  namespace :admin do
    get 'homes/top'
  end
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
