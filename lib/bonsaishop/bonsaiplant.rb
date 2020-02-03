class Bonsaishop::Bonsaiplant
    attr_accessor :price, :title, :tree_url, :description, :category

    @@all = []

    def initialize(title, price, tree_url, category ) 
        @title = title
        @price = price
        @tree_url = tree_url
        # @description = description
        @category = category

        add_to_bonsai(category)
        # get_bonsaiplant_for(description)
        save
    end

    def self.all
        Bonsaishop::Scraper.scrape_bonsais if @@all.empty?
        @@all
    end

    def add_to_bonsai(category)
        category.bonsaiplants << self unless category.bonsaiplants.include?(self)
    end

    def get_bonsaiplant_for(description) 
        Bonsaishop::Scraper.scrape_bonsaiplant_for(self) if @bonsaiplant_for.empty?
    
    end

    def save 
        @@all << self
    end

end