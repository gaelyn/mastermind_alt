require 'minitest/autorun'
require 'minitest/pride'
require './lib/codemaker'
require './lib/codebreaker'
require './lib/turn'
require './lib/game'
require './lib/message'

class GameTest < Minitest::Test
  def setup
    @codemaker = Codemaker.new
    # @codemaker.code = ["R", "R", "G", "B"]
    @codebreaker = Codebreaker.new(@codemaker)
    @turn = Turn.new(@codemaker, @codebreaker)
    @game = Game.new(@codemaker,@codebreaker,@turn)
    @message = Message.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_start_game
    assert_equal @codemaker.randomize, @codemaker.code
  end

  def test_it_can_check_length
    @codebreaker.guess_code("rrr")

    assert_equal @message.short_answer, @turn.guess_length_check

    @codebreaker.guess_code("rrryy")

    assert_equal @message.long_answer, @turn.guess_length_check
  end



end
