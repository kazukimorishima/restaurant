Rails.application.routes.draw do
  
  get 'admin' => 'admins#top'
  resources :admins

  get 'admins/top'

  root 'home#top'
  resources :inquiries do
    resources :answers
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
