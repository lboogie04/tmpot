Rails.application.routes.draw do
  devise_for :users, :controllers => { 
    registrations: 'users/registrations',
    sessions: 'users/sessions' 
  }
  root to: 'pages#home'
  namespace :admin do
    resources :resources
  end

  resources :resources
end
