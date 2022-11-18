Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  get 'pages/design', to: 'pages#design' # delete after setting up design system

  root to: "pages#home"

  resources :fields do
    resources :bookings, only: :create
    resources :reviews, only: [:create, :show]
  end
  namespace :landowner do
    resources :bookings, only: [:index, :update]
    resources :id, only: :show
  end
  resources :bookings, only: [:index, :update,:destroy,:edit]
end
