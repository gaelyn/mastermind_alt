class Game
  attr_reader :codemaker, :codebreaker, :turn, :message
  def initialize(codemaker, codebreaker, turn, message)
    @codemaker = codemaker
    @codebreaker = codebreaker
    @turn = turn
    @message = message
  end

  def start_game
    @message.play_game
    @codemaker.randomize
    @player_input = gets.chomp
    @codebreaker.guess_code(@player_input)
  end

  def turn_loop
    until (@turn.has_won?) || (@turn.number_of_guesses > 10)
      @turn.add_guess
      @message.user_guess
      @player_input = gets.chomp
      @codebreaker.guess_code(@player_input)
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
end
