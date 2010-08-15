Glist::Application.routes.draw do
  resources :items, :functions, :lists, :picks
  root :to => "items#index"
end
