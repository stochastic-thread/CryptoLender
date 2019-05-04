Rails.application.routes.draw do
  get 'users/toggleStatus'
  resources :fund_requirements
  resources :loan_inquiry_details
  resources :loan_inquiries
  resources :loans
  devise_for :users
  get '/toggle', to: "users#toggle"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
end
