class Bonsaishop::Scraper

    def self.scrape_bonsais
        doc = Nokogiri::HTML(open("https://www.bonsaioutlet.com/bonsai-trees/"))

        bonsai_categories = doc.css("div.category-box-content h3 a")

        bonsai_categories.each do |bonsai|
            name = bonsai.text
            url = bonsai.attr("href")
            Bonsaishop::Bonsai.new(name, url)
            
        end
 
    end

    def self.scrape_bonsaiplants(bonsai)
        url = "https://www.bonsaioutlet.com#{bonsai.url}"
        doc = Nokogiri::HTML(open(url))

        trees = doc.css("article.card")
        trees.each do |t|
            title = t.css("h4.card-title").text.strip
            price = t.css("div.card-text").text.strip
            tree_url = t.css("div.yotpo.bottomLine")[0].attributes['data-url'].text
            Bonsaishop::Bonsaiplant.new(title, price, tree_url, bonsai)
        end
      
       
    end

    def self.scrape_bonsaiplant_for(bonsaiplant)
    
        url = "#{bonsaiplant.tree_url}"
        doc = Nokogiri::HTML(open(url))

        details = doc.css("div.productDtlPage")

        details.each do |final|
            title = final.css("h1.productView-title").text.strip
            price = final.css("span.price.price--withoutTax").text.strip
            description = final.css("div.tab-content p").text.strip
            # reviews = final.css("span.sr-only").text.strip
            Bonsaishop::Bonsaiplant_for.new(title, price, description)
        end

    end


end