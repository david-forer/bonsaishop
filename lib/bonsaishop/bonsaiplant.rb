class Bonsaishop::Bonsaiplant
    attr_accessor :price, :page_description, :title, :tree_url

    @@all = []

    def initialize(title, price, tree_url, bonsai) 
        @title = title
        @price = price
        @tree_url = tree_url
        @bonsai = bonsai
        @bonsaiplant_details = []

        add_to_bonsai
        save
    end

    def self.all
        Bonsaishop::Scraper.scrape_bonsais if @@all.empty?
        @@all
    end

    def add_to_bonsai
        @bonsai.bonsaiplants << self unless @bonsai.bonsaiplants.include?(self)
    end

    def get_bonsaiplant_details 
        Bonsaishop::Scraper.scrape_bonsaiplant_details(self) if @bonsaiplant_details.empty?
    
    end

    def save 
        @@all << self
    end

end