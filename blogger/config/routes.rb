Rails.application.routes.draw do
 root 'drinks#index'
 resources :articles do
 	resources :comments
 end
 resources :tags
end
