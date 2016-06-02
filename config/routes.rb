Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show] do
        collection do
          get 'find', to: "customers_finder#show"
          get 'find_all', to: "customers_finder#index"
        end
      end
      resources :invoices, only: [:index, :show] do
        collection do
          get 'find', to: "invoices_finder#show"
          get 'find_all', to: "invoices_finder#index"
        end
      end
      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'find', to: "invoice_items_finder#show"
          get 'find_all', to: "invoice_items_finder#index"
        end
      end
      resources :transactions, only: [:index, :show]
      resources :items, only: [:index, :show]
    end
  end
end
