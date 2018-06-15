class BNBestsellers::Book

  attr_accessor :name, :author, :rating, :release_date, :book_format, :price, :list_price, :discount, :url, :overview
  
  @@all = []
  
  def initialize(category, attributes)
    @category = category
    
    attributes.each do |key, value|
      self.send("#{key}=", "#{value}")
    end
    
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def open_in_browser
    system("open '#{url}'")
  end
  
end
