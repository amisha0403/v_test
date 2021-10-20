Rails.application.routes.draw do
  # Routes Root 
  devise_scope :user do
    root 'devise/sessions#new' 
  end

  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :welcome, only: [:index]
  resources :users
  resources :posts
  resources :projects
  resources :tasks
end
