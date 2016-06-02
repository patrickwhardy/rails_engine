Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        collection do
          get 'find', to: "merchants_finder#show"
          get 'find_all', to: "merchants_finder#index"
          get 'random', to: "merchants_random#show"
        end
        member do
          get 'items', to: "merchants_items#index"
          get 'invoices', to: "merchants_invoices#index"
          get 'customers_with_pending_invoices', to: "merchants_pending_invoices_customers#index"
          get 'favorite_customer', to: "merchants_favorite_customers#show"
          get 'revenue', to: "merchants_revenues#show"
        end
      end
      resources :customers, only: [:index, :show] do
        collection do
          get 'find', to: "customers_finder#show"
          get 'find_all', to: "customers_finder#index"
          get 'random', to: "customers_random#show"
        end
        member do
          get 'invoices', to: "customers_invoices#index"
          get 'transactions', to: "customers_transactions#index"
          get 'favorite_merchant', to: "customers_favorite_merchants#show"
        end
      end
      resources :invoices, only: [:index, :show] do
        collection do
          get 'find', to: "invoices_finder#show"
          get 'find_all', to: "invoices_finder#index"
          get 'random', to: "invoices_random#show"
        end
        member do
          get 'transactions', to: "invoices_transactions#index"
          get 'invoice_items', to: "invoices_invoice_items#index"
          get 'items', to: "invoices_items#index"
          get 'customer', to: "invoices_customers#show"
          get 'merchant', to: "invoices_merchants#show"
        end
      end
      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'find', to: "invoice_items_finder#show"
          get 'find_all', to: "invoice_items_finder#index"
          get 'random', to: "invoice_items_random#show"
        end
        member do
          get 'item', to: "invoice_items_items#show"
          get 'invoice', to: "invoice_items_invoices#show"
        end
      end
      resources :transactions, only: [:index, :show] do
        collection do
          get 'find', to: "transactions_finder#show"
          get 'find_all', to: "transactions_finder#index"
          get 'random', to: "transactions_random#show"
        end
        member do
          get 'invoice', to: "transactions_invoices#show"
        end
      end
      resources :items, only: [:index, :show] do
        collection do
          get 'find', to: "items_finder#show"
          get 'find_all', to: "items_finder#index"
          get 'random', to: "items_random#show"
          get 'most_items', to: "items_most_items#index"
          get 'most_revenue', to: "items_most_revenues#show"
        end
        member do
          get 'invoice_items', to: "items_invoice_items#index"
          get 'merchant', to: "items_merchants#show"
          get 'best_day', to: "items_best_days#show"
        end
      end
    end
  end
end
