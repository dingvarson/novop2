Omini::Application.routes.draw do
  

  resources :rpt_clis do
    collection do
      get 'rpt_clientes'
      get 'rpt_fichacli'
                  
    end
  end

  resources :contacts

  
  
    
  resources :gerapdfs do
    member do
    get 'chama_rpt'
  end
  collection do
      get 'sendemail'
      get 'send_report'
      get 'chama_rpt'
  end
    
  end


  resources :cta_pagars do
    collection do 
      get 'consulta'
    end
  end


  resources :cadprods

   # rotas para consultar contatos
 resources :orders do
  collection do
    get 'consulta'
    get 'consul_cli'
   get 'consuldata'
   
  end
end
  
  
  
   #gerar a ordem de serviço com os items
   resources :orders do
    resources :items  
   end
   
   resources :items  
   
   # rotas para consultar contatos
 resources :orders do
  collection do
    get 'consulta'
    get 'consul_cli'
   
  end
end
    
   resources :Logons 
    
 # rotas para consultar contatos
 resources :contatos do
  collection do
    get 'consulta'
    get 'consul_cli'
   
  end
end

  #consulta de contas á receber pela descrição
  resources :cta_recebers do
  collection do
    get 'consulta'
    get 'consul_cli'
   
  end
end




devise_for :users
  
  resources :menus
  
   
devise_for :users do
  get 'logout' => 'devise/sessions#destroy'
end

# para liberar a alteração da senha mesmo estando autenticado
devise_for :users, :skip => [:registrations]



 resources :cadclis do
  collection do
    get 'consulta'
    get 'consul_cli'
    get 'gerapdf'
  end
end

root :to => "principals#show"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
