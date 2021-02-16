class Game
  attr_reader :codemaker, :codebreaker, :turn, :message
  def initialize(codemaker, codebreaker, turn, message)
    @codemaker = codemaker
    @codebreaker = codebreaker
    @turn = turn
    @message = message
    @codemaker.randomize
  end

  def start_game
    input = user_input_prompt
    if input == "p"
      turn_loop
    elsif input == "i"
      @message.instructions
      start_game
    elsif input == "q"
      @message.quit
    else
      p "I didn't understand that. Please try again."
      start_game
    end
  end

  def turn_loop
    play_game_message
    until (@turn.has_won?)
      cheat
      @turn.add_guess
      @player_input = gets.chomp
      @codebreaker.guess_code(@player_input)
      p "#{@codebreaker.guess.join} has #{@turn.num_correct_colors} of the correct elements with #{@turn.num_correct_positions} in the correct positions."
      p "You've taken #{@turn.number_of_guesses} guess(es)."
    end
  end

  def end_game
    if @turn.has_won?
      @message.end_game
      @player_input = gets.chomp
    end
  end

  def cheat
    p @codemaker.code.join
  end

  def user_input_prompt
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    gets.downcase.chomp
  end

  def play_game_message
    p "I have generated a beginner sequence with four elements made up of: (r)ed,"
    p "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    p "What's your guess?"
  end
end
