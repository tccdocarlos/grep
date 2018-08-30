Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }, path: '/', path_names: {
      sign_in: 'login', sign_out: 'logout',
      password: 'secret', confirmation: 'verification',
      registration: 'register', edit: 'edit/profile'
  }
  authenticate :user do
    resources :bills do
      resources :bill_apportionments
    end  
    resources :bill_types do
      resources :bill_splitings
    end
  end

  authenticated :user do
    root 'bill_types#index', as: :authenticated_root
  end
  root to: "home#index"
  #get 'bill_types/:id/split', action: :split, controller: 'bill_types', as: :bill_types_split
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
