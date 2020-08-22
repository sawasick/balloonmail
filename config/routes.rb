Rails.application.routes.draw do
  root 'balloons#index'
  get "balloons/index", :to => "balloons#index"
  get "balloons/show", :to => "balloons#show"
  get "balloons/detail", :to => "balloons#detail"
  get 'balloons/show/:id' => 'balloons#detail'
  resources :balloons
  resources :bookmarks, only: [:index, :create, :destroy]
  post 'balloons/new'
  post 'balloons/create'
  post 'balloons/update'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "home/top" => "home#top"

end
