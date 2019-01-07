Rails.application.routes.draw do
  
    root 'products#index'  #esto hace que por defecto muestre la pagina
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    resources :users, only: [:new, :create]
	resources :products
	
	
end
