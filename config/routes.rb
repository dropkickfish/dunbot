Rails.application.routes.draw do
  resources :options
  resources :votes
  resources :ballots
  root to: 'pages#home'
  get 'pages/home'
  devise_for :users
  get '/votes/:id/ballot/:participant' => 'votes#ballot', as: 'user_ballot'
end
