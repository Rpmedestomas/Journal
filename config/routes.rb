Rails.application.routes.draw do

  resources :categories do
    resources :tasks
  end

  root "categories#index"
end
