Rails.application.routes.draw do
  root 'welcome#index'
  resources :tasks, only: [:index, :create, :update, :destroy, :show]
  resources :lists, only: [:index, :create, :update, :destroy, :show] do
  end
end
