Rails.application.routes.draw do
  root :to => 'books#top'
  resources :books
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get 'books' => 'books#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
