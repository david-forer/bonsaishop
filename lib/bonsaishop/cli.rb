class Bonsaishop::CLI

    def start
        puts "\nWelcome to The Bonsai Shop!\n"
        get_bonsai_plants
        list_bonsais
        get_user_bonsai
        
    end

    def get_bonsai_plants 
        @bonsai = Bonsaishop::Bonsai.all
    end

    # def get_type_of_plants
    #     #scrape this
    #     @plants = ['Indoor Plants', 'Outdoor Plants', 'Flowering Plants', 'Speciman Plants', 'Starter Plants']
    # end

    def list_bonsais
        puts "\nPlease choose a type of Bonsai Plant to look at:\n"
        @bonsai.each.with_index(1) do |bonsai, index| 
          puts  "#{index}. #{bonsai.name}"
        end
        puts "\n____________________\n"
    end

    def get_user_bonsai
        chosen_bonsai = gets.strip.to_i
        show_bonsais_for(chosen_bonsai) 
        if valid_input(chosen_bonsai, @bonsais)
        end
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end 

    def show_bonsais_for(chosen_bonsai)
        bonsai = @bonsais[chosen_bonsai - 1]
        puts = "Here are the #{bonsais}"
        
    end
end