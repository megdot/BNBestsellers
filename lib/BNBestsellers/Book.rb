class BNBestsellers::Book

  attr_accessor :name, :author, :rating, :release_date, :book_format, :price, :list_price, :discount, :url, :overview
  
  def initialize(url = nil)
    @url = url
    @all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find(i)
    self.all[i-1]
  end
  
end
