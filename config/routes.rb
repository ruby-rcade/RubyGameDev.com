Rubygamedev::Application.routes.draw do

  get '/auth/sign_in', to: 'sessions#new', as: :sign_in
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/sign_out', to: 'sessions#destroy'

  root 'pages#home'
  get 'about' => 'pages#about', as: :about_page

  resources :users, only: [:index, :edit, :update]

  resources :discussions
  resources :comments

  get 'questions' => 'questions#index'

  resources :tutorials

  resources :libraries
  resources :library_categories

  namespace :blog do
    root 'posts#index'
    resources :posts
  end

  get 'd/:id' => 'short_links#discussion', as: :discussion_short_link
  get 't/:id' => 'short_links#tutorial', as: :tutorial_short_link

end
