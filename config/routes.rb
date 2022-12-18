Rails.application.routes.draw do
  root "students#index"

  resources :students do
  end
end
