Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/exhibits', to:'exhibits#index'
  get '/exhibits/new', to: 'exhibits#new'
  post '/exhibits', to: 'exhibits#create'
  patch '/exhibits/:id', to: 'exhibits#update'
  get '/exhibits/:id', to: 'exhibits#show'
  get '/exhibits/:id/edit', to: 'exhibits#edit'
  delete '/exhibits/:id', to: 'exhibits#destroy'
  
  get '/exhibits/:id/artifacts', to: 'exhibits/artifacts#index'
  get '/exhibits/:id/artifacts/new', to: 'exhibits/artifacts#new'
  post '/exhibits/:id/artifacts', to: 'exhibits/artifacts#create'

  get '/artifacts', to: 'artifacts#index'
  patch '/artifacts/:id', to: 'artifacts#update'
  get '/artifacts/:id', to: 'artifacts#show'
  get '/artifacts/:id/edit', to: 'artifacts#edit'
  delete '/artifacts/:id', to: 'artifacts#destroy'
end
