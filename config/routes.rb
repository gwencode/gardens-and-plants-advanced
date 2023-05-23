Rails.application.routes.draw do
  root "gardens#index"
  resources :gardens, except: :index do
    resources :plants, only: :create
  end
  resources :plants, only: :destroy
end
