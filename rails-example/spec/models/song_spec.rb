require "rails_helper"

describe Song, type: :model do
  describe ".new" do
    it "is valid with all required attributes" do
      # create a brand spanking new song

      # make sure that it is valid
      song = Song.new(name: "Titanium", artist: "David Guetta", year: 2005, now_playing: true, rating: 10)

      expect(song).to be_valid
    end

    it "is not valid without a name" do
      # create a song without name

      # make sure that it is not valid
      song = Song.new(artist: "David Guetta", year: 2005, now_playing: true, rating: 10)

      expect(song).to_not be_valid
    end

    it "is not valid without an artist" do
      # create a song without artist

      # make sure that it is not valid
      song = Song.new(name: "Titanium", year: 2005, now_playing: true, rating: 10)

      expect(song).to_not be_valid
    end

    it "defaults to false for the playing attribute if not provided" do
      # create a song

      # make sure that playing is set to false without doing anything else
      song = Song.new(name: "Titanium", artist: "David Guetta", year: 2005, rating: 10)

      expect(song.now_playing).to eq false
    end
  end

  describe "#play!" do
    it "should update now_playing for a given song to true" do
      #setup
      #creating a song that is not playing
      song = Song.create(name: "Titanium", artist: "David Guetta", year: 2005, now_playing: false, rating: 10)

      #execution
      #calling the play! method on the song
      song.play!

      #assertion
      #expecting now_playing on the song to be true
      expect(song.now_playing).to eq true
    end

    it "should update any other song that is now_playing to false" do
      #setup
      jammer_song = Song.create(name: "Titanium", artist: "David Guetta", year: 2005, now_playing: false, rating: 10)
      playing_song = Song.create(name: "Wrecking Ball", artist: "Miley Cyrus", year: 2015, now_playing: true, rating: 9)
      #creating a song that is not playing
      #create a second song that is playing

      #execution
      #calling the play! method on the first song
      jammer_song.play!
      playing_song.reload

      #assertion
      #expecting now_playing on the second song to be false
      expect(playing_song.now_playing).to eq false
    end
  end
end