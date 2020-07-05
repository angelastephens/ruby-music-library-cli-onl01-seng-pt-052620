class Genre 
    attr_accessor :name  
    extend Concerns::Findable 
    @@all = [] 
    def initialize(name)
        @name = name
        @@all << self 
    end

    def songs
        Song.all.select do |song|
        song.genre == self 
        end  
    end 

    def artists 
        songs.map do |song|
        song.artist   
        end.uniq   
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
        Genre.new(name)
    end 
end 