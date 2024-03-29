Moz::Application.routes.draw do

  root :to => "pages#home"

  devise_for :users, :controllers => { :registrations => :registrations }
  devise_for :users, :skip => [:sessions]

  as :user do
    get    'signin' => 'devise/sessions#new', :as => :new_user_session
    post   'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :users, :only => [:show, :index]

  resources :users do 

    resources :comments

    resources :articles, :shallow => true do 
      resources :comments 
    end

    resources :events, :shallow => true do 
      resources :comments 
    end

    resources :videos, :shallow => true do 
      resources :comments 
    end

    resources :youtubes, :shallow => true do
      resources :comments
    end

    resources :playlists, :shallow => true do
      resources :ptracks
    end

    resources :albums, :shallow => true do
      resources :comments

      resources :songs do
        resources :comments
      end

    end
  end

  match '/music'               => "pages#music"
  match '/about'               => "pages#about"
  match '/team'                => "pages#team"
  match '/micropost-dashboard' => 'microposts#home',        as: 'song_dashboard'
  match '/song-dashboard'      => 'songs#home',             as: 'song_dashboard'
  match '/gallery-dashboard'   => 'galleries#home',         as: 'gallery_dashboard'
  match '/album-dashboard'     => 'albums#home',            as: 'album_dashboard'
  match '/events-dashboard'    => 'events#home',            as: 'events_dashboard'
  match '/video-dashboard'     => 'videos#home',            as: 'video_dashboard'
  match '/article-dashboard'   => 'articles#home',          as: 'article_dashboard'


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
