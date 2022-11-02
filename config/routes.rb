Rails.application.routes.draw do
  # added by devise gem that adds various additional path
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "categories#index" 
  resources :categories do
    resources :tasks, :except => [:index]
  end
    resources :tasks, :only => [:index]

end
