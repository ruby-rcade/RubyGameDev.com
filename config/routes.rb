Rubygamedev::Application.routes.draw do

  get '/auth/sign_in', to: 'sessions#new', as: :sign_in
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/sign_out', to: 'sessions#destroy'

  resources :users, only: [:index, :edit, :update] # REVIEW: can we remove index?

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
