Blog::Application.routes.draw do
  resources :posts do #resources will provide all the restful routes
    resources :comments #nested route
  end

  root "posts#index"

  get '/about', to: 'pages#about' # just have to do /about
end
