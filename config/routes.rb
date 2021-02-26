Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations"}
  resources :comments, only: [:index, :show]
  resources :posts, only: [:index, :show] do 
    resources :comments do 
      resources :replies
    end
  end
 



  root 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
