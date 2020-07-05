require "pry"

class Song
    attr_accessor :name 
    attr_reader :artist, :genre    
    
    extend Concerns::Findable

    @@all = [] 
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
      end

   def artist=(artist)
    @artist = artist 
    artist.add_song(self)
   end 

   def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)  
   end 

    def self.all
        @@all  
    end
    
    def self.destroy_all
        @@all.clear  
    end 

    def save
        @@all << self  
    end 

    def self.create(name)
       new_song = Song.new(name)
       new_song.save 
       new_song 
    end

    def self.find_by_name(song_name)
        @@all.find do |song|
            song.name == song_name  
        end  
    end 

    def self.find_or_create_by_name(song_name) 
        find_by_name(song_name) || Song.create(song_name) 
    end 


    # def self.new_from_filename(filename)
    #     parts = filename.split(" - ")
    #     artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
    #     artist = Artist.find_or_create_by_name(artist_name)
    #     genre = Genre.find_or_create_by_name(genre_name)
    #     new(song_name, artist, genre)
    #   end 

    def self.new_from_filename(name)
        new_name =  name.chomp!(".mp3").split(" - ")
        artist_name = new_name[0]
        song_name = new_name[1] 
        genre_name = new_name[2]

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        Song.new(song_name, artist, genre) 
      end 

      def self.create_from_filename(filename)
        new_song = self.new_from_filename(filename)
        new_song.save 
      end 
end 