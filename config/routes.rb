Rails.application.routes.draw do

  get '/maps/:code/tiles/:id', to: 'tiles#show', as: 'tiles'

  get '/maps/:code', to: 'maps#show', as: 'maps'
  resource :maps, only: :create

  post '/', to: 'main#crawl'

  resources :tiles do
    member do
      post :reroll
    end
  end

  root 'main#index'

end
