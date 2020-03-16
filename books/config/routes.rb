Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users
  resources :books
  get 'books/book.id' => 'books#show'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
