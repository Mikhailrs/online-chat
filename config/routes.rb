Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :rooms, only: [:create, :show, :index]

  root "rooms#index"
end
