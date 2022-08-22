Rails.application.routes.draw do
  resources :measurements
  resources :servings
  resources :intakes
  root "servings#index"
end
