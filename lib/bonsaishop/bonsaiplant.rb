class Bonsaishop::Bonsaiplant
    attr_accessor :price, :title, :tree_url, :description

    @@all = []

    def initialize(title, price, tree_url, bonsai) 
        @title = title
        @price = price
        @description = description
        @tree_url = tree_url
        @bonsai = bonsai
        @bonsaiplant_for = []

        add_to_bonsai
        # get_bonsaiplant_for
        save
    end

    def self.all
        Bonsaishop::Scraper.scrape_bonsais if @@all.empty?
        @@all
    end

    def add_to_bonsai
        @bonsai.bonsaiplants << self unless @bonsai.bonsaiplants.include?(self)
    end

    def get_bonsaiplant_for 
        Bonsaishop::Scraper.scrape_bonsaiplant_for(self) if @bonsaiplant_for.empty?
    
    end

    def save 
        @@all << self
    end

end