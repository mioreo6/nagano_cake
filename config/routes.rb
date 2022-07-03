Rails.application.routes.draw do


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
    resources :items, except: [:destroy, :update, :create]
    patch 'items/:id' => 'items#update', as: 'update_item'
    post 'items/new' => 'items#create'
  end
  namespace :admin do
   patch 'order_detail/:id' => 'order_detail#update'
  end

  namespace :admin do
   root to: "homes#top"
  end


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }




  devise_scope :public do
  root to: "public/homes#top"
  get 'about' => 'public/homes#about', as: 'about'
  resources :addresses, only: [:index, :edit, :create, :destroy], module: 'public'
  patch 'addresses/:id/edit' => 'public/addresses#update'
  resources :orders, only: [:new, :index, :create, :show], module: 'public'
  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'
  resources :cart_items, only: [:index, :update, :destroy, :create, :destroy_all], module: 'piblic'
  delete 'cart_items' => 'public/cart_items#destroy_all'
  resources :items, only: [:index, :show], module: 'public'
  get 'customers/show' => 'public/customers#show'
  get 'customers/edit' => 'public/customers#edit'
  patch 'customers' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'
end

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations", only: [:new, :create],
  sessions: 'public/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
