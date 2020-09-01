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
  resource :customers, only: [:show, :edit, :update]
  # マイページ表示
  get 'customers/my_page' => 'customers#show'
  # 退会処理
  get 'customers/unsubscribe' => 'customers/unsubscribe'
  patch 'customers/withdraw' => 'customers/withdraw'


  # 商品関連（いいね・コメント含む）
  resources :products, only: [:show, :index] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  # 商品ジャンル関連
  resources :genres, only: [:show]
  # 生産者関連（いいね含む）
  resources :producers, only: [:show, :index] do
    resource :favorites, only: [:create, :destroy]
  end
  # 注文関連
  resources :orders, only: [:new, :index, :create, :show]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'
  resources :shippings, only: [:index, :create, :edit, :update, :destroy]
  
  resources :carts, only: [:show]
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'
  delete '/delete_item_all' => 'carts#delete_item_all'

  # 今回は中間テーブルの役割だからいらない？
  # resources :cart_items, only: [:create, :index, :update, :destroy] do
    # collection do
      # delete 'destroy_all'
    # end
  # end



  # 管理者用 devise ルーティング
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'home/index' => 'home#index'
    #検索結果表示用
    get 'search' => 'customers#search'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update] do
      resources :comments, only: [:destroy]
    end
    resources :genres, only: [:index, :create, :edit, :update]
    resources :producers, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end


end
