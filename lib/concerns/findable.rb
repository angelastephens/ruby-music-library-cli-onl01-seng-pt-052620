# module Concerns::Findable

#     def find_by_name(name)
#         self.all.find{|song| song.name ==name}
#     end

#     def find_or_create_by_name(name)
#         self.find_by_name(name) || self.create(name)
#     end

# end 




module Concerns::Findable 
    def find_by_name(song_name)
        self.all.find do |song|
            song.name == song_name  
        end  
    end 

    def find_or_create_by_name(song_name) 
        self.find_by_name(song_name) || self.create(song_name) 
    end 
end 