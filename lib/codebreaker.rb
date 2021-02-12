class Codebreaker
  attr_reader :codemaker, :guessed
  def initialize(codemaker)
    @codemaker = codemaker
    @guessed = guessed
  end

  def guess(player_guess)
    @guessed = player_guess.upcase.split("")
  end

  def correct_guess?
    @guessed == codemaker.code
  end

  def num_correct_colors
    4 - (@guessed - codemaker.code).count
  end
end
