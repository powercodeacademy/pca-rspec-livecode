class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.string :artist, null: false
      t.integer :year
      t.boolean :now_playing, default: false
      t.integer :rating

      t.timestamps
    end
  end
end
