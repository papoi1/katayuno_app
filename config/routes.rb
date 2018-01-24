Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'katas#index'

  get '/katas/:id' => 'katas#show', as: :kata
  get '/new/katas' => 'katas#new', as: :new_kata
  post '/create/katas' => 'katas#create', as: :create_katas
  get '/edit/katas/:id' => 'katas#edit', as: :edit_kata
  patch '/katas/:id' => 'katas#update'
  delete '/katas/:id' => 'katas#delete', as: :delete_kata

end
