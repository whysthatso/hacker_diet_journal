Rails.application.routes.draw do
  resources :servings
  resources :intakes
  root "servings#index"
end
