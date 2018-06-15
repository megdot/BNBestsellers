class BNBestsellers::Category
  attr_accessor :name, :books
  
  @@all = []
  
  def initalize(name, books)
    @name = name
    @books = books.collect do |attributes|
      Book.new(self, attributes|
    end
    
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.print_all
    @@all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
    end
  end
  
  def self.find(id)
    @@all[id.to_i-1]
  end
  
  def find_book(id)
    self.books[id.to_i-1]
  end

end
