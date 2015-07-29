Rubygamedev::Application.routes.draw do

  get "tag/index"
  get '/auth/:provider/callback', to: 'sessions#create_from_omniauth'

  resources :users, only: [:create, :edit, :update]
  get '/account' => 'users#edit_current_user', as: :account

  resources :posts
  resources :comments
  resources :tag

  resources :libraries
  resources :library_categories

  get 'about' => 'pages#about', as: :about_page
  root 'pages#home'

  # Short Links
  get ':id' => 'short_links#post', as: :post_short_link, constraints: { id: /\d+/ }

end
