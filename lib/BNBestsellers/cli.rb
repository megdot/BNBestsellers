class BNBestsellers::CLI

  def call
    puts "---------------------------------------------".colorize(:gold)
    puts ""
    puts "Welcome to Barnes & Nobles Bestsellers!".colorize(:green)
    puts ""
    puts "---------------------------------------------".colorize(:gold)
    puts ""
    puts "Please wait momentarily while we retreive this week's bestselling books.".colorize(:green)
    fiction = Category.new("Fiction Bestsellers", Scraper.scrape_fiction)
    nonfiction = Category.new("Nonfiction Bestsellers", Scraper.scrape_nonfiction)
    paperback = Category.new("Paperback Bestsellers", Scraper.scrape_paperback)
    mass = Category.new("Mass Market Paperback Bestsellers", Scraper.scrape_mass)
    teens = Category.new("Teens Bestsellers", Scraper.scrape_teens)
    young_readers = Category.new("Young Readers Bestsellers", Scraper.scrape_young_readers)
    puts ""
    puts "Which category would you like to view the top selling books for?"
    puts ""
    category_list
    menu
  end
   
  def category_list
    Category.print_all
  end
    
  def menu
    puts "To view a complete list of bestselling books by category, please enter the number of the category that you would like to see."  
    puts ""
    puts "Otherwise, to exit, please enter 'exit'.".colorize(red)
    
    input = gets.strip
    
    if @input.to_i.between?(1, Category.all.count)
      category_bestsellers
    elsif input == "exit"
      exit
    else
      puts "Invalid entry. Please try again."
    end
  end

  def book_list
    @the_category = Category.find(@input)
    
    puts "Top Books in #{@the_category.name}:"
    
    @the_category.books.each.with_index(1) do |book, index|
      puts " #{index}. #{book.title} by # {book.author}"
    end
    book
  end
  
  def book 
    puts ""
    puts "Please type the number of the book you would like more information on:"
    puts ""
    
    book_input = gets.strip
    book = @the_category.find_book(book_input)

  def print_info(book)
    puts "-------------- Name ----------------"
    puts ""
    puts "#{book.name}"
    puts ""
    puts "------------- Author ---------------"
    puts ""
    puts "#{book.author}"
    puts ""
    puts "------------- Rating ---------------"
    puts ""
    puts "#{book.rating} out of 5"
    puts ""
    puts "------------ Published -------------"
    puts ""
    puts "#{book.release_date}"
    puts ""
    puts "------------ Format --------------"
    puts ""
    puts "#{book.book_format}"
    puts ""
    puts "------------- Price ----------------"
    puts ""
    puts "#{book.price}"
    puts ""
    puts "----------- List Price -------------"
    puts ""
    puts "#{book.list_price}"
    puts ""
    puts "------------ Discount --------------"
    puts ""
    puts "#{book.discount}"
    puts ""
    puts "--------------- URL ----------------"
    puts ""
    puts "www.barnesandnoble.com#{book.url}"
    puts ""
    puts "------------- Overview -------------"
    puts ""
    puts "#{book.overview}"
    puts ""
    
    puts "Would you like to view this book on your browser? Enter Y/N"
    browser_input = gets.strip.upcase
    
    if browser_input == "Y"
      book.open_in_browser
    end
    
    puts "Would you like to see another book?  Enter Y/N, or type 'list' to go back to the category list."
    if input == "Y"
      book
    elseif input == "LIST"
      category_list
      menu
    else
      exit
    end
  end
  
  def exit
    puts "Thank you for visiting.  We hope that you found exactly what you were looking for!"
    puts "Come back soon!"
    main_menu
  end


end
