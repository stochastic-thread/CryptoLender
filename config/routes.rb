Rails.application.routes.draw do
  get 'payment_gateway/create_transaction'
  # get 'users/toggleStatus'
  resources :fund_requirements
  resources :loan_inquiry_details
  resources :loan_inquiries
  resources :loans
  devise_for :users
  authenticated :user do 
    root :to => "pages#dashboard" 
  end
  get '/toggle',          to: "users#toggle"
  get '/showViableFunds', to: "users#showViableFunds"
  get '/investor_profiles', to: "pages#profiles"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
end
