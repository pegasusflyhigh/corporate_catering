Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  devise_for :users, :skip => [:registrations] 

  resources :companies do
    resources :users do
      get 'search', :on => :collection
    end
  end

  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :vendors do
  	resources :menu_items
  end	
  post 'vendors/select_vendors' => 'vendors#select_vendors', :as => 'select_vendors'

end
