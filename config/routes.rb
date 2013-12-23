Turkeythanks::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  namespace :thanksgiving do
    resources :cards, only: [:new, :create, :show]
  end

  namespace :christmas do
    resources :cards, only: [:new, :create, :show]
  end

  namespace :hanukkah do
    resources :cards, only: [:new, :create, :show]
  end

  # post 'thanksgiving/new' => 'catalog#new'
  # post 'christmas/new' => 'catalog#new'
  # post 'hanukkah/new' => 'catalog#new'

  # get 'thanksgiving' => 'catalog#thanksgreeting'
  # get 'christmas' => 'catalog#christmas'
  # get 'hanukkah' => 'catalog#hanukkah'

  # get 'thanksgiving/:url' => 'catalog#show'
  # get 'christmas/:url' => 'catalog#show'
  # get 'hanukkah/:url' => 'catalog#show'
end
