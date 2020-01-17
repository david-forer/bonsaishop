class Bonsaishop::Scraper

    def self.scrape_bonsais
        doc = Nokogiri::HTML(open("https://www.bonsaioutlet.com/bonsai-trees/"))
binding.pry
 
    end


end