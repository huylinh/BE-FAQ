Rails.application.routes.draw do
  resources :faqs
  get '/faqsfilter', to: 'faqs#filter'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :titles 
  get '/titlesfilter', to: 'titles#filter'
  # Defines the root path route ("/")
  # root "articles#index"
end
