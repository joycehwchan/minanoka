Rails.application.routes.draw do
  devise_for :users
  get 'pages/design', to: 'pages#design' # delete after setting up design system

  root to: "pages#home"

  resources :fields
end
