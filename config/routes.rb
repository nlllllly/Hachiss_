Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # メインページルーティング
  root 'home#index'
  

  # 会員用 devise ルーティング
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  # 会員情報
    # resource :customers, only: [:update]
  get 'customers/my_page' => 'customers#show'
  get 'customers/unsubscribe' => 'customers/unsubscribe'
  patch 'customers/withdraw' => 'customers/withdraw'
  
  
  # 商品関連（いいね・コメント・検索 含む）
  resources :products, only: [:show, :index] do
    resource :product_favorites, only: [:create, :destroy]
    resources :product_comments, only: [:create, :destroy]
  end
  get 'products/search' => 'products#search'
  # 商品ジャンル関連
  resources :genres, only: [:show]
  # 生産者関連（いいね含む）
  resources :producers, only: [:show, :index] do
    resource :producer_favorites, only: [:create, :destroy]
  end
  # 注文関連
  resources :orders, only: [:new, :index, :create, :show]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'
  resources :shippings, only: [:index, :create, :edit, :update, :destroy]
  # カート関連
  resources :cart_items, only: [:create, :index, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end



  # 管理者用 devise ルーティング
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'home' => 'home#index'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :product_comments, only: [:destroy]
    end
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :producers, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end



end
