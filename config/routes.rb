Rails.application.routes.draw do
  devise_for :users
  get 'pages/design', to: 'pages#design' # delete after setting up design system

  root to: "pages#home"

  resources :fields, only: [:index, :show, :new, :create] do
    resources :bookings, only: :create
    resources :reviews, only: :create
  end
  namespace :landowner do
    resources :bookings, only: :index
  end
  resources :bookings, only: [:index, :update,:destroy,:edit]
end
