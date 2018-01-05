Rails.application.routes.draw do
  
  root to: 'home#index'

  get 'admin', to: 'admin#index'
  
  get 'learning', to: 'learning#index'
  
  resources :books, path: '/learning/books'
  
  resources :courses, path: '/learning/courses'
  
  controller :sessions do
    get 'sign_in' => :new
    post 'sign_in' => :create
    delete 'sign_out' => :destroy
  end
end
