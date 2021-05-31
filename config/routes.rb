Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'index#index'
  get '/index' , to: 'index#index'
  get '/search' => 'index#search'

  get '/test' => "index#test"

  resources :bike_stoles
  post '/search' => "index#search"

end
