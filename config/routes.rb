Rails.application.routes.draw do
  scope path: '/api' do
    api_version(module: 'Api::V1', path: { value: 'v1' }, defaults: { format: 'json' }) do
      resources :entries
      mount Shrine.presign_endpoint(:cache) => "/s3/presign"
    end
  end
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  mount Sidekiq::Web => '/queue'
  mount Shrine.download_endpoint => "/attachments"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
