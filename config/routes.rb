Rubygamedev::Application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create_from_omniauth'

  resources :users, only: [:create, :edit, :update]
  get '/account' => 'users#edit_current_user', as: :account

  resources :posts

  # TODO: remove these since they have been superceded by posts
  resources :discussions
  resources :comments
  get 'questions' => 'questions#index'
  resources :tutorials

  resources :libraries
  resources :library_categories

  get 'about' => 'pages#about', as: :about_page
  root 'pages#home'

  # Short Links
  get 'd/:id' => 'short_links#post' # DEPRECATED
  get 't/:id' => 'short_links#post' # DEPRECATED
  get ':id' => 'short_links#post', as: :post_short_link, constraints: { id: /\d+/ }

end
