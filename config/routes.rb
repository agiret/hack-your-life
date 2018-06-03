Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :hacks, except: [:show] do
    # resources :votes, only: [:create, :new, :destroy]
    post :upvote
    delete :downvote
    # member do
    #   post 'upvote'
    # end
  end

end
