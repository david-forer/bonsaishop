class Bonsaishop::Bonsaiplant_for
    attr_accessor :title, :price, :tree_url, :description

    @@all = []

    def initialize(title, price, description) 
        @title = title
        @price = price
        @description = description
        # @bonsaiplant = bonsaiplant
        @bonsaiplant_for = []

        # add_to_bonsaiplants
        
        save
    end

    def self.all
        Bonsaishop::Scraper.scrape_bonsaiplant_for if @@all.empty?
        @@all
    end

    # def add_to_bonsaiplants
    #     @bonsaiplant.bonsaiplant_for << self unless @bonsaiplant.bonsaiplant_for.include?(self)
    # end

    def save 
        @@all << self
    end

end