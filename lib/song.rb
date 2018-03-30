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

  def self.find_or_create_by_name(find_song)
    find_it = self.all.detect {|x| x.name == find_song}
    if find_it == nil
      s = self.new
      s.name = find_song
      s.save
      s
    end
    find_it
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(mp3)
    c = self.new
    c.name = mp3.split(/[^a-zA-Z\s] | \s-\s/)[0]
    c
  end


end
