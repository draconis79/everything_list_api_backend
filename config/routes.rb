Rails.application.routes.draw do
  root 'welcome#index'
  resources :list_categories, only: [:create, :destroy, :update, :show]
  resources :list_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :create, :update] do
    collection do
      post '/login', to: 'users#login'
    end

    resources :list_categories, only: [:index, :completed, :task] do
      collection do
        get 'completed', to: 'list_categories#completed'
        get 'task', to: 'list_categories#task'
      end
    end
  end
end
