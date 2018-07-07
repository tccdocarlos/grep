Rails.application.routes.draw do
  root to: "bill_types#index"
  resources :bill_types
  get 'bill_types/:id/split', action: :split, controller: 'bill_types', as: :bill_types_split
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
