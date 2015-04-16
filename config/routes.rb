MusicApp::Application.routes.draw do

  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:create, :new, :show]

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, except: [:index, :new] do
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:index, :new]

end
