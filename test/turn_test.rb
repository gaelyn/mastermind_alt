require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/codemaker'
require './lib/codebreaker'
require './lib/message'

class TurnTest < Minitest::Test
  def setup
    @codemaker = Codemaker.new
    @codemaker.code = ["R", "G", "B", "Y"]
    @codebreaker = Codebreaker.new(@codemaker)
    # @message = Message.new
    @turn = Turn.new(@codemaker, @codebreaker)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_can_find_code
    assert_equal @codemaker.code, @turn.find_code
  end

  # def test_it_can_check_length
  #   @codebreaker.guess_code("rrr")
  #
  #   assert_equal @message.short_answer, @turn.guess_length_check
  #
  #   @codebreaker.guess_code("rrryy")
  #
  #   assert_equal @message.long_answer, @turn.guess_length_check
  # end

  def test_for_winner
    @codebreaker.guess_code("rgby")
    assert_equal true, @turn.has_won?
  end

  def test_it_can_evaluate_num_correct_colors
    @codebreaker.guess_code("yrbr")

    assert_equal 3, @turn.num_correct_colors
  end

  def test_num_correct_colors_returns_0
    codemaker = Codemaker.new
    codemaker.code = ["R", "G", "B", "Y"]
    codebreaker = Codebreaker.new(codemaker)
    turn = Turn.new(codemaker, codebreaker)
    codebreaker.guess_code("zzzz")

    assert_equal 0, turn.num_correct_colors
  end

  def test_num_correct_colors_returns_4
    codemaker = Codemaker.new
    codemaker.code = ["R", "G", "B", "Y"]
    codebreaker = Codebreaker.new(codemaker)
    turn = Turn.new(codemaker, codebreaker)
    codebreaker.guess_code("ybgr")

    assert_equal 4, turn.num_correct_colors
  end

  def test_num_correct_colors_returns_2
    codemaker = Codemaker.new
    codemaker.code = ["R", "G", "B", "Y"]
    codebreaker = Codebreaker.new(codemaker)
    turn = Turn.new(codemaker, codebreaker)
    codebreaker.guess_code("rgrg")

    assert_equal 2, turn.num_correct_colors
  end

  def test_num_correct_colors_returns_3
    codemaker = Codemaker.new
    codemaker.code = ["R", "G", "R", "G"]
    codebreaker = Codebreaker.new(codemaker)
    turn = Turn.new(codemaker, codebreaker)
    codebreaker.guess_code("rrrg")

    assert_equal 3, turn.num_correct_colors
  end

  def test_it_can_evaluate_num_correct_positions
    @codebreaker.guess_code("yrbr")

    assert_equal 1, @turn.num_correct_positions
  end
  end









# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/codemaker'
# require './lib/codebreaker'
# require './lib/turn'
#
# class TurnTest < Minitest::Test
#   def setup
#     @codemaker = Codemaker.new
#     @codemaker.code = ["R", "R", "G", "B"]
#     @codebreaker = Codebreaker.new(@codemaker)
#     @turn = Turn.new(@codemaker, @codebreaker)
#   end
#
#   def test_it_exists
#     assert_instance_of Turn, @turn
#   end
#
#   def test_it_can_evaluate_correct_guesses
#     @codebreaker.guess_code("yrbr")
#
#     assert_equal false, @turn.correct_guess?
#
#     @codebreaker.guess_code("rrgb")
#     assert_equal true, @turn.correct_guess?
#   end
#
#   def test_it_can_evaluate_num_correct_colors
#     @codebreaker.guess_code("yrbr")
#
#     assert_equal 3, @turn.num_correct_colors
#   end
#
#   def test_it_can_evaluate_num_correct_positions
#     @codebreaker.guess_code("yrbr")
#     assert_equal 1, @turn.num_correct_positions
#
#     @codebreaker.guess_code("rrrr")
#     assert_equal 2, @turn.num_correct_positions
#
#     @codebreaker.guess_code("rrgr")
#     assert_equal 3, @turn.num_correct_positions
#
#     @codebreaker.guess_code("rrgb")
#     assert_equal 4, @turn.num_correct_positions
#     assert_equal true, @turn.correct_guess?
#
#   end
# end
