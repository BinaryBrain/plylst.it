Rails.application.routes.draw do
  devise_for :users
	root 'playlists#discover'
	get 'discover' => 'playlists#discover'
	get 'songs/add' => 'songs#new'
	get 'playlists/favorite' => 'playlists#favorite' # Used to add a favorite
	get 'playlists/favorites' => 'playlists#favorites' # Used to display favorites

	resources :playlists do
		collection do
			get :my_playlists
			get :discover
		end
	end
	resources :users
	resources :songs do
		collection do
			get :add
		end
	end
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# Serve websocket cable requests in-process
	# mount ActionCable.server => '/cable'
end
