class Bonsaishop::Bonsai
    attr_accessor :name, :bonsaiplants

    @@all = []

    def initialize(name) 
        @name = name
        @bonsaiplants = []
        # @url = url
        # @description = 
        # @price = 

        save
    end

    def self.all
        Bonsaishop::Scraper.scrape_bonsais if @@all.empty?
        @@all
    end

    def get_bonsaiplants 
        Bonsaishop::Scraper.scrape_bonsaiplants(self) if @bonsaiplants.empty?
        # @bonsaiplants
    end

    def save 
        @@all << self
    end

end