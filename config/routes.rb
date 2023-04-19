Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :movies
  resources :genres, except: :show

  get '/:short_url', controller: :movies, action: :short_url
end
