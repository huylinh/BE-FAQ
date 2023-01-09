Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
  resources :faqs
  get '/filterWithId', to: 'faqs#filterWithId'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :titles 
  get '/titlesfilter', to: 'titles#filter'
  # Defines the root path route ("/")
  # root "articles#index"
    end
  end
end
