Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations"}
  resources :comments, only: [:index, :show]
  resources :posts, only: [:index, :show] do 
    resources :users, only: [:index]
    resources :comments do 
      resources :replies
    end
  end
  resources :users, only: [:show] do
    resources :posts, only: [:index]
  end


root 'static#home'
# match '*path' => 'application#fallback', via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
