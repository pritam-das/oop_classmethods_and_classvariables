class Book
  @@on_shelf = []
  @@on_loan = []

  attr_reader :title, :author, :isbn
  attr_accessor :due_date

  def self.create(title, author, isbn)
    @new_book = Book.new(title, author, isbn)
    @@on_shelf << @new_book
    @new_book
    #call return to library

  end

  def self.current_due_date
    date_today = Time.now
    puts "The Date and time right now is #{date_today}"
    @due_date = date_today + (7*24*60*60)
    puts "Your due date and time is #{@due_date}"
    return @due_date

  end

  def self.overdue_books
    @@on_loan.each do |overdue_books|
      if (overdue_books.due_date < Time.now)
        puts "#{overdue_books.title} by #{overdue_books.author} was due on #{overdue_books.due_date}"
      end
    end
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.available
    puts "The following books are available on shelf:\n"
    @@on_shelf.each do |available_books|
      puts "#{available_books.title} by #{available_books.author}"
    end
  end

  def self.borrowed
    puts "The following books have been borrowed:\n"
    @@on_loan.each do |borrowed_books|
      puts "#{borrowed_books.title} by #{borrowed_books.author}"
    end
  end




  ####################Instance Methods############################
  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @due_date = "N/A"

  end

  def borrow
    check = self.lent_out?
    if check == true
      return false
    else
      @due_date = Book.current_due_date
      temp = self
      @@on_loan << temp
      @@on_shelf.delete(self)
       puts "The book #{self.title} has been lent out and your return date is #{@due_date}"
      return true

    end
end

 def return_to_library
   check = self.lent_out?
   if check == true
     @due_date = "N/A"
     temp = self
     @@on_shelf << temp
     @@on_loan.delete(self)
     puts "The book #{self.title} has been succesfully returned to the shelf"
     return true
   else
     return false
   end
 end

  def lent_out?
    @@on_loan.each do |borrowed_books|
      if (borrowed_books.title) == self.title
        return true
      end
    end
      return false

  end

  def renew
    @due_date = @due_date + (7*24*60*60)
    puts "Your new return date for the book #{self.title} is #{@due_date}"
  end  




end
