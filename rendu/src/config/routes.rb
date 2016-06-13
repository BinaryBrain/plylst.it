Rails.application.routes.draw do
  devise_for :users
	root 'playlists#discover'
	get 'discover' => 'playlists#discover'
	get 'songs/add' => 'songs#new'
	get 'playlists/favorite' => 'playlists#favorite' # Used to add a favorite
	get 'playlists/favorites' => 'playlists#favorites' # Used to display favorites

	get ':user_id/playlists' => 'playlists#by_user'

	get 'friends' => 'friends#show'
	get 'friends/add' => 'friends#add'
	get 'friends/invite/:user_id' => 'friends#invite'
	get 'friends/accept/:user_id' => 'friends#accept'
	get 'friends/remove/:user_id' => 'friends#remove'
    
    get 'users' => 'users#show_users'
    delete 'users/:id' => 'users#destroy'
    
    delete 'playlists/:playlist_id/songs/:song_id' => 'playlists#remove_song'

	resources :playlists do
		collection do
			get :my_playlists
			get :discover
		end
	end

	resources :songs do
		collection do
			get :add
		end
	end
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# Serve websocket cable requests in-process
	# mount ActionCable.server => '/cable'
end
