Rails.application.routes.draw do
  get 'sku/:device/:carrier/:size/:state/price' => 'sku#price'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'sell-iphone' => 'application#index'
  get 'sell-ipad' => 'application#index'
  get 'sell-ipod' => 'application#index'
  get 'offer' => 'application#index'
  get 'about-us' => 'application#index'
  get 'contact-us' => 'application#index'
  get 'shipping-label' => 'application#index'
  get 'checkout' => 'application#index'
  get 'shipping' => 'application#index'
  get 'confirm-details' => 'application#index'
  get 'thank-you' => 'application#index'
  get 'legal' => 'application#index'
  get 'home' => 'welcome#index'
  post 'orders' => 'order#create'
  # Example of regular route:
    # get 'about' => 'welcome#about'
    # get 'contact' => 'welcome#contact'
    # get 'sell' => 'welcome#sell'
    # get 'offer' => 'offer#index'
  get ':device/:carrier/:size/:condition/offer' => 'application#index'
  get ':device/:size/:condition/offer' => 'application#index'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
