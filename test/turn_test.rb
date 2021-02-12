require 'minitest/autorun'
require 'minitest/pride'
require './lib/codemaker'
require './lib/codebreaker'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists
    codemaker = Codemaker.new
    player = Codebreaker.new(codemaker)
    new_turn = Turn.new(codemaker, player)
    assert_instance_of Turn, new_turn
  end

  def test_it_can_evaluate_player_guess
    codemaker = Codemaker.new
    player = Codebreaker.new(codemaker)
    new_turn = Turn.new(codemaker, player)
    codemaker.randomize

    assert player.guess("yrbr") != codemaker.randomize
  end
end
