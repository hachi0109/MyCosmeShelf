Rails.application.routes.draw do
  devise_for :users
  # 未ログイン時のトップページ
  root to: 'static_pages#top'
  get 'mypage', to: 'users#show', as: :user_root
  # コスメ関連
  resources :cosmetics, only: [:index, :new, :create]
end
