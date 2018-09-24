Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :shops
      resources :orders
      resources :products
      resources :line_items
    end
  end
end
