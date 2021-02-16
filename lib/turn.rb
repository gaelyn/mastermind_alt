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
    guess = @codebreaker.guess
    answer = @codemaker.code
    answer.each do |letter|
      match = guess.index(letter)
      if match
        guess.delete_at(match)
      end
    end
    answer.count - guess.count
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
#     @message = Message.new
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
