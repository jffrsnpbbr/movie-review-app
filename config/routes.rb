Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :movies
  resources :genres, except: :show
end
