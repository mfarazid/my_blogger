MyBlogger::Application.routes.draw do

  root to: "articles#index"
  get 'articles/like/:id' => "articles#like", as: :article_like
  devise_for :users
  
  resources :articles do
    resources :comments
  end
  resources :tags

end
