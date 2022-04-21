Rails.application.routes.draw do
  resources :coins
  root 'pages#home'
end
