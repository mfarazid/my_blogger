MyBlogger::Application.routes.draw do

  get "articles/index"
  get "articles/show"
  get "tags/index"
  get "tags/show"
  get "authorizations/index"
  get "authorizations/show"
  get "users/index"
  get "users/Index"
  get "users/show"
  mount RedactorRails::Engine => '/redactor_rails'
  root to: "articles#index"
  get 'articles/like/:id' => "articles#like", as: :article_like
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, 
      controllers: {omniauth_callbacks: "omniauth_callbacks"}
  
  resources :articles, only: [:index, :new, :create, :show, :destroy]  do
    resources :comments, only: [:create]
  end
  resources :tags
  resources :users, only: [:edit, :update]

  namespace :admin do
    get 'dashboard/home' => "dashboard#home", as: :dashboard_home
    resources :dashboard, only: [:home]
    resources :articles, only: [:index, :show, :destroy]
    resources :tags, only: [:index, :destroy]
    resources :authorizations, only: [:index, :destroy]
    resources :users, only: [:index, :show, :destroy]
  end
end


