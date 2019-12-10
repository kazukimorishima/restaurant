Rails.application.routes.draw do
  
  get 'admin' => 'admins#top'
  resources :admins

  get 'admins/top'
  
  resources :menus, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :courses, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :dinners, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :spaces, only: [:index, :new, :create, :edit, :update, :destroy]

  root 'home#top'
  resources :inquiries do
    resources :answers
  end
  
  get "menu" => "home#menu"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
