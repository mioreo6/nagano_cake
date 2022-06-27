Rails.application.routes.draw do

  namespace :admin do
    get 'orders/show'
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
namespace :public do
  root to: "homes#top"
  get 'about' => 'homes#about', as: 'about'
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:new, :confirm, :index, :create, :show]
  resources :cart_items, only: [:index, :update, :destroy, :create, :destroy_all]
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update]
  get 'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  get 'orders/complete' => 'orders#complete'
  patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
