Rails.application.routes.draw do
  resources :bills do
    resources :bill_apportionments
  end  
  #resources :bill_months
  resources :bill_types do
    resources :bill_splitings
  end
  root to: "bill_types#index"
  #get 'bill_types/:id/split', action: :split, controller: 'bill_types', as: :bill_types_split
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
