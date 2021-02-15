class Turn
  attr_reader :codemaker, :codebreaker, :number_of_guesses

  def initialize(codemaker, codebreaker)
    @codemaker = codemaker
    @codebreaker = codebreaker
    # @guess = nil
    # @winner = false
    @number_of_guesses = 0
  end

  def add_guess
    @number_of_guesses += 1
  end

  def find_code
    @codemaker.code
  end

  def has_won?
    # @winner = true if @codebreaker.guess == @codemaker.code
    @codebreaker.guess == @codemaker.code
  end

  def num_correct_colors
    # create new array showing difference of each element
    @num_elements_array = @codemaker.colors.map do |color|
      @codebreaker.guess.count(color) - @codemaker.code.count(color)
    end
    # creates an array of numbers like [1, -1, -2, 2]

    # create a new array with only positive numbers because
    # this will tell us where the guess has more of one element
    # than the code has (positive number represents incorrect elements included)
    @positive_nums = @num_elements_array.reject do |num|
        num < 0
    end
    # example above will return [1, 2]

    # now add the positive numbers together to get total incorrect
    @total = @positive_nums.reduce(0) do |sum, num|
      sum + num
    end
    # => 3

    #number of total elements in code minus 3 incorrect elements in guess
    @codemaker.code.count - @total
    #=> 1

    # @codemaker.code.length - (@codemaker.code - @codebreaker.guess).count
  end

  def num_correct_positions
    @zipped_array = @codemaker.code.zip(@codebreaker.guess)
    @zipped_array.count do |array|
      array[0] == array[1]
    end
  end

end






# class Turn
#   attr_reader :codemaker, :codebreaker
#   def initialize(codemaker, codebreaker)
#     @codemaker = codemaker
#     @codebreaker = codebreaker
#     # @message = message
#   end
#
#   def correct_guess?
#     @codebreaker.guess == @codemaker.code
#   end
#
#   def num_correct_colors
#     (@codemaker.code.count) - (@codemaker.code - @codebreaker.guess).count
#     # @codemaker.code.difference(@codebreaker.guess)
#   end
#
#   def num_correct_positions
#     @zipped_array = @codemaker.code.zip(@codebreaker.guess)
#     @num_correct_positions = @zipped_array.count do |array|
#       array[0] == array[1]
#     end
#   end
# end
