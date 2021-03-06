Rails.application.routes.draw do

  devise_for :users, path: 'session'



  api_version(:module => "V1", :path => {:value => "v1"}) do
    root 'articles#index'
    match '/foursquare' => 'foursquare#search', via: :get
    match '/foursquare/:id' => 'foursquare#find', via: :get
    resources :articles
    resources :locations
    resources :users
    match '/configuration' => 'configuration#show', via: :get
  end
  
  
  api_version(:module => "V2", :path => {:value => "v2"}, :default => true) do
    root 'articles#index'
    match '/foursquare' => 'foursquare#search', via: :get
    match '/foursquare/:id' => 'foursquare#find', via: :get
    resources :articles
    resources :locations
    resources :users
    match '/configuration' => 'configuration#show', via: :get
  end
  
end
