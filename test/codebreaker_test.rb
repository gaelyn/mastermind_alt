require 'minitest/autorun'
require 'minitest/pride'
require './lib/codebreaker'
require './lib/codemaker'

class CodebreakerTest < Minitest::Test
  def setup
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new(@codemaker)
  end

  def test_it_exists
    assert_instance_of Codebreaker, @codebreaker
  end

  def test_player_can_make_a_guess
    @codebreaker.guess_code("rrbg")
    assert_equal ["R", "R", "B", "G"], @codebreaker.guess
  end
end





# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/codemaker'
# require './lib/codebreaker'
#
# class CodebreakerTest < Minitest::Test
#   def setup
#     @codemaker = Codemaker.new
#     @player = Codebreaker.new(@codemaker)
#   end
#
#   def test_it_exists
#     assert_instance_of Codebreaker, @player
#   end
#
#   def test_player_can_make_a_guess
#     @player.guess_code("rrbg")
#     assert_equal ["R", "R", "B", "G"], @player.guess
#   end
#
#   def test_it_can_evaluate_correct_guesses
#     @codemaker.code = ["R", "R", "G", "B"]
#     @player.guess_code("rrrr")
#
#     assert_equal false, @player.correct_guess?
#
#     @codemaker.code = ["R", "R", "R", "R"]
#
#     assert_equal true, @player.correct_guess?
#   end
#
#   def test_how_many_correct_colors
#     @codemaker.code = ["R", "B", "B", "Y"]
#     @player.guess_code("rgby")
#
#     assert_equal 3, @player.num_correct_colors
#   end
# end
