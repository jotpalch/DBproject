Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'index#index'
  get '/index' , to: 'index#index'
  get '/search' => 'index#search'
  get '/map' => 'index#map'
  get '/test' => "index#test"
  post '/search' => "index#search"

end
