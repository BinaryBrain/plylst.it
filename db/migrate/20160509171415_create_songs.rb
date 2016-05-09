class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :filename
      t.string :original_url

      t.timestamps
    end
  end
end
