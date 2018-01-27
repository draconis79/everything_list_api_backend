Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  resources :list_categories
  resources :list_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
