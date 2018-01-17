Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'katas#index'

get '/katas/:id' => 'katas#show', as: :kata
end
