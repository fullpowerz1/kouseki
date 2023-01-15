Rails.application.routes.draw do
# 会員用1
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }

# ゲストログイン
  devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

# 検索機能
  get "search" => "searches#search"

# 会員用2
scope module: :public do
  root :to =>"homes#top"
  get "about"=>"homes#about"

  resources :ores, only: [:index,:show,:edit]

  get 'customers/my_page' =>"customers#show"
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw'

  post 'rankings/confirm' => 'rankings#confirm'
  get 'rankings/complete' => 'rankings#complete'


  resources :rankings, only: [:new,:create,:index,:show] do
    resources :stone_comments, only: [:create, :destroy]
  end

  resources :decorations, only: [:index,:edit,:create,:destroy,:update]
end

#管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get "admin" => 'admin/homes#top'

  namespace :admin do
    resources :ores, except: [:destroy]

    resources :genres, only: [:index,:create,:edit,:update]

    resources :customers, only: [:index,:show,:edit,:update]

    resources :rankings, only: [:show,:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
