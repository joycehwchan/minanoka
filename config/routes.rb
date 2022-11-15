Rails.application.routes.draw do
  devise_for :users
  get 'pages/design', to: 'pages#design' # delete after setting up design system

  root to: "pages#home"
  resources :fields do
    resources :bookings, only: %i{:new, :create}
    resources :reviews, only: %i{:new, :reate, :edit, :update}
  end
  resources :landowner do
    resources :bookings, only: %i{:edit, :update, :index, :show}
  end
  resources :bookings, only: %i{:destroy}
  resources :reviews, only: %i{:destroy}
end
