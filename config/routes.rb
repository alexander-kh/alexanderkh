Rails.application.routes.draw do
  
  get 'admin', to: 'admin#index'
  
  controller :sessions do
    get 'sign_in' => :new
    post 'sign_in' => :create
    delete 'sign_out' => :destroy
  end
  
  scope '(:locale)' do
    resources :books
    resources :courses
    root 'home#index', as: 'root', via: :all
  end
end
