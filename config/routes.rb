Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

#顧客側のルート
namespace :public do
  resources :customers
  #退会確認画面
  get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :likes, only: [:index, :create, :destroy]
    resources :bookmarks, only: [:index, :destroy]
    resources :pictures, only: [:create, :index, :show, :edit, :update, :destroy]
    resources :tags, only: [:index, :create, :edit, :desroy]
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
