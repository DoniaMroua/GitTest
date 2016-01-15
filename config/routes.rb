Rails.application.routes.draw do
  resources :books
  resources :authors
  root to: 'application#angular'
end
