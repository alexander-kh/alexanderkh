Rails.application.routes.draw do
  
  get 'admin', to: 'admin#index'
  
  controller :sessions do
    get 'sign_in' => :new
    post 'sign_in' => :create
    delete 'sign_out' => :destroy
  end
  
  scope '(:locale)' do
    notes_routes = lambda do
      resources :notes, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :books, &notes_routes
    resources :courses, &notes_routes
    root 'home#index', as: 'root', via: :all
  end
end
