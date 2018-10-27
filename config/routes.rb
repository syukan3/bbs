Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: %i(index update edit show)
  resources :posts, only: %i(index create new update edit destroy show)
  resources :rooms, only: %i(index create new update edit destroy show) do
    resources :posts, only: %i(index create new update edit destroy show)
  end
  resources :members, only: %i(index create new update edit destroy show)

  get '/' => 'home#top'
  post "/posts/:id/edit" => "posts#edit"

  get "/users/guestin" => "users#guestin"
  get "/users/guestout" => "users#guestout"

  get "/welcom/guest_login" => "welcome#guest_login"
  get "/welcome/guest_logout" => "welcome#guest_logout"

#  get "login" => "users#login_form"
#  get "signup" => "users#signup"
#  post "users/create" => "users#create"
#  post "login" => "users#login"
#  get "users/:id" => "users#show"
#  post "users/:id/update" => "users#update"
#  get "users/:id/edit" => "users#edit"
#  get "logout" => "users#logout"

end
