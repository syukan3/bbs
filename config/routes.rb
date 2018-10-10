Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "users/index" => "users#index"
  get '/' => 'home#top'

#  get "login" => "users#login_form"
#  get "signup" => "users#signup"
#  post "users/create" => "users#create"
#  post "login" => "users#login"
  get "users/:id" => "users#show"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
#  get "logout" => "users#logout"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
