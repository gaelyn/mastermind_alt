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
    until @turn.has_won?
      @message.user_guess
      @player_input = gets.chomp
      @codebreaker.guess_code(@player_input)
    end
  end

  def cheat
    p @codemaker.code.join
  end
end
