MyBlogger::Application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'
  root to: "articles#index"
  get 'articles/like/:id' => "articles#like", as: :article_like
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, 
      controllers: {omniauth_callbacks: "omniauth_callbacks"}
  
  resources :articles, only: [:index, :new, :create, :show, :destroy]  do
    resources :comments, only: [:create]
  end
  resources :tags, only: [:show]
  resources :users, only: [:edit, :update]
  resources :authorizations, only: [:index, :show]

  namespace :admin do
    get 'dashboard/home' => "dashboard#home", as: :dashboard_home
    resources :dashboard, only: [:home]
    resources :articles, only: [:index, :show, :update, :destroy]
    resources :tags, only: [:index, :destroy]
    resources :authorizations, only: [:index, :destroy]
    resources :users, only: [:index, :show, :destroy]
  end
end


