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
        puts "\n_________________________________________________\n"
        get_user_bonsai_tree(bonsai)
        
    end

    def get_user_bonsai_tree(bonsai_category)
        puts "Please choose a tree(number) to see more details."
        input = gets.strip.strip.to_i
        # binding.pry
        #bonsaiplant = Bonsaishop::Bonsaiplant.all
        bonsaiplant = bonsai_category.bonsaiplants[input.to_i - 1]
        # bonsaiplant.get_bonsaiplant_for
        # binding.pry
        Bonsaishop::Scraper.scrape_description_for(bonsaiplant)

        puts "Here are the bonsai details for #{bonsaiplant.title}:"

        puts "Price: #{bonsaiplant.price}"
        puts "Show url: #{bonsaiplant.tree_url}"
        puts "Category: #{bonsaiplant.category}"
        puts "Description: #{bonsaiplant.description}"

         puts "\n________________________________________\n"
        #  binding.pry
        next_menu
    end

        def next_menu
            puts "Would you like to look at another tree? Type: 'tree'"

            puts "Or maybe start over with another category? Type: 'start'"

            puts "I would like to exit! Type: 'exit'"

            input = gets.strip.downcase

            if input == "tree"
                list_bonsais
                get_user_bonsai
            elsif input == "start"
                start
            elsif input == "exit"
                puts "Goodbye Friend!"
            else
                puts "Sorry I didn't understand what you typed, try again please"
                     next_menu      
            end
        end
    
    # def show_bonsaiplant_details(bonsaiplant)

    #     puts "Here are the bonsai details you are looking for:"

    #     bonsaiplant.each do |p|
    #         puts "nice One"
    #     end

    # end

    # def show_bonsaiplant_for(bonsaiplant)
    #     # binding.pry
    #     bonsaiplant = @bonsaiplants[bonsaiplant -1]
    #     bonsaiplant.get_bonsaiplant_for
    #     puts "Here are the bonsai details you are looking for:"
        
    #     bonsaiplant.bonsaiplant_for do |bonsaiplant_for|
    #         puts "#{bonsaiplant_for.title} #{bonsaiplant_for.price} #{bonsaiplant_for.description}"
    #     end
    # end
end
