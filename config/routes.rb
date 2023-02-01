Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/exhibits', to:'exhibits#index'
  get '/exhibits/:id', to: 'exhibits#show'
    # the colon and key word makes the route dynamic (not a symbol) called "dynamic routing"
  get '/artifacts', to: 'artifacts#index'
  get '/artifacts/:id', to: 'artifacts#show'
  # get '/exhibits/:exhibit_id/artifacts', to: 'exhibits_artifacts#index'
end
