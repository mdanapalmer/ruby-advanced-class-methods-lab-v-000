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

def self.create
  song = Song.new
  @@all << song
  song
end

def self.new_by_name(name)
  song = Song.new
  song.name = name
  song
end

def self.create_by_name(name)
  song = Song.new
  song.name = name
  @@all << song
  song
end

def self.find_by_name(name)
  @@all.find do |song|
    song.name == name
  end
end

def self.find_or_create_by_name(name)
  find_by_name(name) || create_by_name(name)
end

def self.alphabetical
  @@all.sort_by { |song| song.name}
end

def self.new_from_filename(filename)
  file_name = filename.split(" - ")
  songs = file_name.collect do |element|
    data = element.split(".mp3")
    artist = data[0]
    name = data[1]

    song = Song.new
    song.artist_name = artist
    song.name = name
    song
  end
end

end
