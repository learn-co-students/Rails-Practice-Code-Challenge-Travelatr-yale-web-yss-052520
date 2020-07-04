Rails.application.routes.draw do

  resources :bloggers, only: [:show, :new, :create]
  resources :destinations, only: [:show]
  resources :posts, only: [:show, :new, :create, :edit, :update]
  post '/likes', to: 'posts#likes', as: "post_likes"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
