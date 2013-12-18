CityStop::Application.routes.draw do

  devise_for :users
  root :to => "home#index"

  get '/itineraries/public' => 'itineraries#public'
  resources :itineraries
  get 'itineraries' => 'itineraries#index', as: :user_root

end
