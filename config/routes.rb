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
  get '/', to: "pages#index"
  get '/dashboard', to: "pages#dashboard"
  get '/toggle',          to: "users#toggle"
  get '/showViableFunds', to: "users#showViableFunds"
  get '/investor_profiles', to: "pages#profiles"
  post '/payment_gateway/create_transaction', to: "payment_gateway#create_transaction"
  get '/fund_requirements', to: "fund_requirements#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
end
