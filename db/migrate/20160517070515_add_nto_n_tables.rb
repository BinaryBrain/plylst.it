class AddNtoNTables < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists_songs do |t|
        t.integer "playlist_id"
        t.integer "song_id"
    end
    create_table :favorites do |t|
        t.integer "playlist_id"
        t.integer "user_id"
    end
    create_table :friends do |t|
        t.integer "user1_id"
        t.integer "user2_id"
    end
    create_table :pending_invites do |t|
        t.integer "invitor_id"
        t.integer "invitee_id"
    end
  end
end
