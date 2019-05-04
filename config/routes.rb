Rails.application.routes.draw do
  resources :loan_inquiries
  resources :loans
  devise_for :users
  authenticated :user do 
    root :to => "pages#dashboard" 
  end
  root to: "pages#index"
end
