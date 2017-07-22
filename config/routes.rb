Rails.application.routes.draw do

  root 'welcome#index'

  get '/play', to: "users#play"

  post '/users/answer_submit'

  get '/congratulations', to: "questions#congratulations"

  get '/leaderboards', to: "users#index"

  devise_for :users
  resources :questions, only: [:show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
