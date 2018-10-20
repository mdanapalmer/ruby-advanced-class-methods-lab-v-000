require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create(song_name)
  song = Song.new(song_name)
  @@all << song
end

end
