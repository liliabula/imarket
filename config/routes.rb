Rails.application.routes.draw do
  devise_for :users
  
  resources :mentors do
    resources :reviews
    resources :reservations
  end


  root 'pages#home'
  get 'about' => 'pages#about'
  get 'bementor' => 'pages#bementor'
  get 'dashboard' => 'pages#dashboard'
  post '/call/:id', to:'transactions#create', as: :call
  get '/pickup/:guid', to:'transactions#pickup', as: :pickup 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

end
