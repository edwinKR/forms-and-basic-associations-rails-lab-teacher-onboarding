class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # Setter
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  # Getter
  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  # Setter : 
  def note_contents=(given_notes)
    puts "==== From Song Class: Setter method ========="
    puts "Given Notes Array (notes attributes): "
    puts given_notes.inspect

    puts "self.notes: song instance has_many notes "
    puts self.notes.inspect

    given_notes.each do |new_content|
      if new_content != ''
        # added_note = Note.create(content: new_content)
        # self.notes << added_note

        self.notes.build(content: new_content)
      end
    end

    puts "after shoving into proxy: "
    puts self.notes.inspect

  end
  
  def note_contents
    puts "==== From Song Class: Getter Method ==="
    puts self.inspect
    puts "Getter method: "
    puts self.notes.inspect


    # The getter method: Just wants the contents array format.
    self.notes.map{|note| note.content}
    # same as:
    # self.notes.map(&:content)
  end

end
