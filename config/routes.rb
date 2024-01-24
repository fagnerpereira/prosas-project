Rails.application.routes.draw do
  resources :grades
  resources :criterions
  resources :evaluations
  resources :projects

  get "up" => "rails/health#show", as: :rails_health_check

  root "projects#index"
end
