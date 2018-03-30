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
    
  end


end
