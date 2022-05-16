Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  #resources :auths, only: [:create]
  resources :kinds
  
  api_version(:module => "v1", :header => {:name => "X-Version", :value => "1.0"}) do
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'
  
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'
  
      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: 'relationships/phone'
  
      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  
    end  
  end  


  
  constraints subdomain: 'v2' do
    scope module: 'v2'  do
      resources :contacts do
        resource :kind, only: [:show]
        resource :kind, only: [:show], path: 'relationships/kind'
    
        resource :phones, only: [:show]
        resource :phones, only: [:show], path: 'relationships/phones'
    
        resource :phone, only: [:update, :create, :destroy]
        resource :phone, only: [:update, :create, :destroy], path: 'relationships/phone'
    
        resource :address, only: [:show, :update, :create, :destroy]
        resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    
      end
    end  
  end

end
