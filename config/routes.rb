Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :rooms, only: [:create, :show, :index], param: :title
  resources :messages, only: :create

  root "rooms#index"
end
