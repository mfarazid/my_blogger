MyBlogger::Application.routes.draw do

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
end
