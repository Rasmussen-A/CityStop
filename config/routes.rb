CityStop::Application.routes.draw do

  devise_for :users

  resources :itineraries

  root :to => "home#index"
  match 'itineraries' => 'itineraries#index', as: :user_root, via: :get

end
