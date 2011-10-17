CMSRoR::Application.routes.draw do


  scope :path => "admin" do
      resources :sitelinks
      resources :illustrated_texts
      resources :step_groups
      resources :origins
      resources :side_texts
      resources :partners
      resources :free_contents
      resources :users
      resources :recipes
      resources :contacts
      resources :product_thumbnails
      resources :news_snippets
      resources :products
      resources :product_families
      resources :header_illustrations
      resources :navigation_entries
      resources :users, :content_wrappers, :containers
      resources :content_wrappers, :only => [ :show ] do
       resources :content_wrapper_contents
      end
      resources :content_wrapper_contents, :except => [ :new, :create ]
      resources :container_contents, :except => [ :new, :create ]
      resources :containers, :only => [ :show ] do
       resources :container_contents
      end
    end

  resources :messages, :only => [ :new, :create ]
  devise_for :users

end
