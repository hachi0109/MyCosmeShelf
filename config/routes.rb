Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#top'
  resource :user, only: [:show]
  resources :cosmetics
end
