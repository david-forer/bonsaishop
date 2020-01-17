class Bonsaishop::Bonsaiplants
    attr_accessor :page_name, :page_description, :price, :bonsai,  :url, :bonsai_plant_name

    @@all = []

    def initialize(page_name, page_desription) 
        @page_name = page_name
        @page_description = page_description
        @bonsai = bonsai
        @bonsai_plant_name = bonsai_plant_name
        @price = 
        @url = url
        save
    end

    def self.all
        Bonsaishop::Scraper.scrape_bonsais if @@all.empty?
        @@all
    end

    def add_to_bonsai
        @bonsai.bonsaiplants << self unless @bonsai.bonsaiplants.include?(self)
    end

    # def get_bonsaiplant_details 
    #     Bonsaishop::Scraper.scrape_bonsaiplants_deatails(self) if @bonsaiplants.empty?
    
    # end

    def save 
        @@all << self
    end

end