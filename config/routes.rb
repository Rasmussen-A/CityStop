CityStop::Application.routes.draw do

  devise_for :users

  root :to => "home#index"
  match 'itineraries' => 'itineraries#index', as: :user_root

  end
