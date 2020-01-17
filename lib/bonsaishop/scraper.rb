class Bonsaishop::Scraper

    def self.scrape_bonsais
        doc = Nokogiri::HTML(open("https://www.bonsaioutlet.com/bonsai-trees/"))


        bonsai_categories = doc.css("div.category-box-content h3 a")

        bonsai_categories.each do |bonsai|
            name = bonsai.text
            Bonsaishop::Bonsai.new(name)
        end
 
    end

    def self.scrape_bonsaiplants(bonsai)
        
        Bonsaishop::Bonsaiplants.new("fake details", bonsai)
        Bonsaishop::Bonsaiplants.new("fake details more", bonsai)
        Bonsaishop::Bonsaiplants.new("fake details the third", bonsai)
       
    end


end