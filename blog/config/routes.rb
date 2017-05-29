Blog::Application.routes.draw do
  resources :posts do
    resources :comments #nested route
  end

  root "posts#index"
end
