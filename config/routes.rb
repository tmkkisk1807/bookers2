Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  root to: "homes#top"
   get "home/about" => "homes#about", as: "about"
   resources :books
   post "users/:id" => "users#show"
   resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
