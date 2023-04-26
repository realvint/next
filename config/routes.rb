Rails.application.routes.draw do
  constraints subdomain: 'next' do
    root 'counterparties#index'

    resources :counterparties
    resources :products
    resource :products_import, only: %i[new create]
  end
end
