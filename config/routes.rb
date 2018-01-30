Rails.application.routes.draw do
  root 'welcome#index'
  resources :tasks, only: [:index, :create, :update, :destroy, :show]
  resources :categories, only: [:index, :create, :update, :destroy, :show] do
  end
end
