class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    new_artist = Artist.find_or_create_by(name: artist_name)
    self.artist = new_artist
    self.artist.name
  end

  def artist_name
    self.artist.name if self.artist
  end

  def genre_name=(genre_name)
    new_genre = Genre.find_or_create_by(name: genre_name)
    self.genre = new_genre
    self.genre.name
  end

  def genre_name
    self.genre.name if self.genre
  end

  def notes=(notes)
    notes.each do |note|
      new_note = Note.find_or_create_by(content: note)
      self.notes << new_note
    end
  end
end
