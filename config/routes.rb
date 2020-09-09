Rails.application.routes.draw do
  get 'home/about' => "home#about"
  root 'home#top'
  devise_for :users
  resources :users
  resources :books

end

