class BNBestsellers::Scraper

  def self.scrape_fiction
    fiction = Nokogirl::HTML(open("https://www.barnesandnoble.com/b/bn-stores-bestsellers-fiction/_/N-1p4m", :allow_redirections == :all))
      count = 1
      while count < 11
        array = []
        fiction.css("div.product-info").collect do |book|
        book_info = {
          :url => "http://www.barnesandnoble.com#{hfict.css("#listView > li:nth-child(#{count}) > ul > li > div.product-image > a:nth-child(1)").attribute("href").value}"
        }

        book_page = Nokogiri::HTML (open(book_info[:url], :allow_redirections => :all))
        book_info[:title] = book_page.css("h1").text
        book_info[:author] = book_page.css("span > a").first.text
        book_info[:summary] = book_page.css(".flexColumn").text.strip

        book_array << book_info
        count += 1
       end
    end
      array
  end
 
 
  def self.scrape_fiction
    fiction = Nokogirl::HTML(open("https://www.barnesandnoble.com/b/bn-stores-bestsellers-fiction/_/N-1p4m", :allow_redirections == :all))
      count = 1
      while count < 11
        array = []
        fiction.css("div.product-info").collect do |book|
        book_info = {
          :url => "http://www.barnesandnoble.com#{hfict.css("#listView > li:nth-child(#{count}) > ul > li > div.product-image > a:nth-child(1)").attribute("href").value}"
        }

        book_page = Nokogiri::HTML (open(book_info[:url], :allow_redirections => :all))
        book_info[:title] = book_page.css("h1").text
        book_info[:author] = book_page.css("span > a").first.text
        book_info[:summary] = book_page.css(".flexColumn").text.strip

        book_array << book_info
        count += 1
       end
    end
      array
  end
 
