class Song < ApplicationRecord
  validates_presence_of :name, :artist

  def play!
    previous_playing_song = Song.find_by(now_playing: true)
    previous_playing_song&.update(now_playing: false)
    update(now_playing: true)
  end
end
