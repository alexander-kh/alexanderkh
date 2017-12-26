Rails.application.routes.draw do
  root to: 'home#index'

  get 'admin', to: 'admin#index'
  
  controller :sessions do
    get 'sign_in' => :new
    post 'sign_in' => :create
    delete 'sign_out' => :destroy
  end
end
