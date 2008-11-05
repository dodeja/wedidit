ActionController::Routing::Routes.draw do |map|
  map.resources :posts
  map.resources :post_images
 
 
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
  map.connect '/', :controller => 'posts', :action => 'index'
  map.connect '/gallery', :controller => 'posts', :action => 'gallery'
 
  map.contact '/contact', :controller => 'pages', :action => 'contact'
  map.feedback '/feedback', :controller => 'pages', :action => 'feedback'
  map.faq '/faq', :controller => 'pages', :action => 'faq'
 
  map.connect '/gallery', :controller => 'posts', :action => 'gallery'
  map.root :controller => 'posts', :action => 'index'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end