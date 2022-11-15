Rails.application.routes.draw do
  devise_for :users
  get 'pages/design', to: 'pages#design' # delete after setting up design system

  root to: "pages#home"

  resources :fields, %i{:index, :show, :new, :create} do
    resources :bookings, only: %i{:create}
    resources :reviews, only: %i{:create}
  end
  namespace :landowner do
    resources :bookings, only: :index
  end
  resources :bookings, only: %i{:index, :update}
end
