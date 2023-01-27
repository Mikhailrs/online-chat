Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :rooms, only: [:create, :show, :index], param: :title

  root "rooms#index"
end
