Rails.application.routes.draw do
  devise_for :users 
  resources :posts

  resources :users do 
    resources :posts, only: [:index, :show, :new, :destroy, :edit, :update, :create]
  end
 



  root 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
