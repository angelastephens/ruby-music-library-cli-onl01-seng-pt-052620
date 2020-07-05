class Artist 
    attr_accessor :name, :songs
    extend Concerns::Findable 
    @@all = []
    def initialize(name)
        @name = name
        @@all << self  
    end  

    def self.all
        @@all  
    end

    def songs
        Song.all.select do |song|
        song.artist == self 
        end  
    end 

    def genres
        songs.map do |song|
        song.genre 
        end.uniq   
    end 

    def add_song(song)
        song.artist || song.artist = self  
    end 

    def self.destroy_all
        @@all.clear  
    end 

    def save 
        @@all << self  
    end 

    def self.create(name)
        Artist.new(name)
    end 
end 