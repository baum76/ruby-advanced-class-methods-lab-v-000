require "pry"

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
    s = self.new
    s.save
    s
  end

  def self.new_by_name(string_song_name)
    s = self.new
    s.name = string_song_name
    s
  end

  def self.create_by_name(string_song_name)
    s = self.new
    s.name = string_song_name
    s.save
    s
  end

  def self.find_by_name(string_song_name)
    self.all.detect {|i| i.name == string_song_name}
  end

  def self.find_or_create_by_name(string_song_name)
    self.find_by_name(string_song_name) || self.create_by_name(string_song_name)
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(mp3_formatted_file)
    c = self.new
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s] |\s-\s/)[1].gsub('.mp3', '')
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s] |\s-\s/)[0]
    c
  end

  def self.create_from_filename(mp3_formatted_file)
    c = self.new
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s] |\s-\s/)[1].gsub('.mp3', '')
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s] |\s-\s/)[0]
    c.save
    c
  end
  def self.destroy_all
    self.all.clear
  end
end
