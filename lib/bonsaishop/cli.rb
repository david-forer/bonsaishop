class Bonsaishop::CLI

    def start
        puts "Welcome to The Bonsai Shop!"
        puts "Please choose a type of Bonsai Plant to look at:"
        get_type_of_plants
        get_user_plants
        #user
        
    end

    def get_type_of_plants
        #scrape this
        @plants = ['Indoor Plants', 'Outdoor Plants', 'Flowering Plants', 'Speciman Plants', 'Starter Plants']
    end

    def get_user_plants
        #list_plants
        @plants.each.with_index {|plant, index| 
          puts  "#{index}. #{plant}"
        }
    end
end