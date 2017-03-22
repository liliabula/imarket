Rails.application.routes.draw do
  resources :mentors
  devise_for :users
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'bementor' => 'pages#bementor'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

end
