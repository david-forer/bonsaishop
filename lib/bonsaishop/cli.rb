class Bonsaishop::CLI

    def start
        puts "\nWelcome to The Bonsai Shop!\n"
        get_bonsai_plants
        list_bonsais
        get_user_bonsai
        # show_bonsais_for
        
    end

    def get_bonsai_plants 
        @bonsais = Bonsaishop::Bonsai.all
    end

    # def get_type_of_plants
    #     #scrape this
    #     @plants = ['Indoor Plants', 'Outdoor Plants', 'Flowering Plants', 'Speciman Plants', 'Starter Plants']
    # end

    def list_bonsais
        puts "\nPlease choose a type of Bonsai Plant to look at:\n"
        @bonsais.each.with_index(1) do |bonsai, index| 
          puts  "#{index}. #{bonsai.name}"
        end
        puts "\n____________________\n"
    end

    def get_user_bonsai
        chosen_bonsai = gets.strip.to_i
        show_bonsais_for(chosen_bonsai) if valid_input(chosen_bonsai, @bonsais)
        
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end 

    def show_bonsais_for(chosen_bonsai)
        bonsai = @bonsais[chosen_bonsai -1]
        bonsai.get_bonsaiplants
        puts "Here are the #{bonsai.name}"
        bonsai.bonsaiplants.each.with_index(1) do |bonsaiplant, int|
            puts "#{int}. #{bonsaiplant.title} "
        end
        get_user_bonsai_tree(bonsai)
        
    end

    def get_user_bonsai_tree(bonsai)
        puts "Please choose a tree(number) to see more details."
        input = gets.strip.strip.to_i
        # bonsaiplant = bonsai.bonsaiplants[input.to_i - 1]
        # bonsaiplant.get_bonsaiplant_for
        binding.pry
        show_bonsaiplant_for(bonsaiplant)
    end

    def show_bonsaiplant_for(bonsaiplant)
        bonsaiplant = @bonsaiplants[bonsaiplant -1]
        bonsaiplant.get_bonsaiplant_for
        puts "Here are the bonsai details you are looking for:"
        
        bonsaiplant.bonsaiplant_for do |bonsaiplant_for|
            puts "#{bonsaiplant_for.title} #{bonsaiplant_for.price} #{bonsaiplant_for.description}"
        end
    end
end
