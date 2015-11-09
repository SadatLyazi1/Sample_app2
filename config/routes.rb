Rails.application.routes.draw do
  
  
  root "pages#home"
  resources :recipes do
    member do
      post 'like'
    end
    resources :reviews, only:[:new, :create,:edit]
   end
   
  # get '/recipes', to: 'recipes#index'
  # get '/recipes/new', to:'recipes#new', as: 'new_recipe'
  # post '/recipes', to: 'recipes#create'
  # get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  # patch '/recipes/:id', to: 'recipes#update'
  # get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  # delete '/recipes/:id', to: 'recipes#destroy'

  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get 'logout', to: 'logins#destroy'


  resources :chefs
  resources :ingredients, only:[:new, :create,:show]
  resources :styles, only:[:new, :create,:show]

  #resources :reviews


  #match '/recipes/:id/reviews', to: 'reviews#show', via: 'get'
  #match '/recipes/:id/reviews/edit', to: 'reviews#edit', via: 'get'
  #match '/recipes/id/reviews/new' to: 'reviews#new', via: 'get'

 


end