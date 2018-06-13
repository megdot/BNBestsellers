class BNBestsellers::CLI

  def call
    puts "---------------------------------------------".colorize(:gold)
    puts ""
    puts "Welcome to the B&N Top 100: Book Bestsellers".colorize(:green)
    puts ""
    puts "---------------------------------------------".colorize(:gold)
    puts ""
    puts "Find your next read by choosing a category! We'll take care of the rest and give you an organized list of top performers!".colorize(:green)
    puts "Less time searching so you can spend more time reading!".colorize(:green)
    main_menu
    exit
  end
    
  def main_menu
    puts "To view a complete list of categories, please enter 'list'.  Otherwise, to exit, please enter 'exit'."
    input = gets.strip
    if input == "list"
      list
    elsif input == "exit"
      exit
    else
      puts "Invalid entry. We're sorry, we didn't get that.  To view a list of categories, please enter 'list'.  Otherwise, to exit, please enter 'exit'."
    end
  end

  def exit
    puts "Thank you for visiting.  We hope that you found exactly what you were looking for!"
    puts "Come back soon!"
    main_menu
  end

  def list_books
    BNBestsellers::Book.all.each.with_index(1) do |book, i|
      puts "#{i}. #{book.name}"
    end
  end

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
    puts "#{book.old_price}"
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
  end

end
