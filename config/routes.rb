Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

#顧客側のルート
namespace :public do
  resources :likes, only: [:create, :destroy]
  resources :bookmarks, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :customers do
    resource :relationships, only:[:create,:destroy]
    member do
        get :following, :followers
        get :likes
        get :bookmarks
        get :comments
      end
    end
  #退会確認画面
  get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :pictures, only: [:create, :new, :index, :show, :edit, :update, :destroy]
    resources :tags, only: [:index, :create, :edit, :destroy]
  end

  #管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root :to =>"homes#top"
  resources :customers, only: [:index, :show, :edit, :update]
  resources :pictures, only: [:index, :show, :edit, :update, :destroy]
  resources :tags, only: [:index, :create, :edit, :update]
end
end
