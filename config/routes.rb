Rails.application.routes.draw do
  # root to: 'cocktails#index'

  patch 'cocktails/:id', to: 'cocktails#heart', as: :cocktail_heart

  resources :cocktails, only: [ :index, :show, :create ] do
  	resources :doses, only: [ :new, :create, :destroy ]
  end
  
end

