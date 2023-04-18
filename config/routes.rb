Rails.application.routes.draw do
  constraints subdomain: 'next' do
    root 'counterparties#index'

    resources :counterparties
  end
end
