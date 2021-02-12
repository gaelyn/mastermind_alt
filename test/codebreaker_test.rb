require 'minitest/autorun'
require 'minitest/pride'
require './lib/codemaker'
require './lib/codebreaker'

class CodebreakerTest < Minitest::Test
  def test_it_exists
    codemaker = Codemaker.new
    player = Codebreaker.new(codemaker)
    assert_instance_of Codebreaker, player
  end

  def test_player_can_make_a_guess
    codemaker = Codemaker.new
    player = Codebreaker.new(codemaker)

    assert_equal player.guess("rrbg"), ["R", "R", "B", "G"]
  end

  def test_it_can_evaluate_correct_guesses
    codemaker = Codemaker.new
    player = Codebreaker.new(codemaker)
    codemaker.randomize
    player.guess("rrrr")

    assert_equal false, player.correct_guess?
  end

  def test_how_many_correct_colors
    codemaker = Codemaker.new
    player = Codebreaker.new(codemaker)
    codemaker.randomize
    player.guess("rgby")

    assert_equal player.num_correct_colors.class, Integer
    assert(player.num_correct_colors <= 4)
  end
end
