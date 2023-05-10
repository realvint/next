Rails.application.routes.draw do

  constraints subdomain: 'next' do
    root 'counterparties#index'

    resources :counterparties
    resources :products do
      patch :add_elso_image, to: 'products#add_elso_image'
      delete 'destroy_attachment_image/:id', to: 'products#destroy_attachment_image', as: :destroy_image
    end
    resource :products_import, only: %i[new create]
  end
end
