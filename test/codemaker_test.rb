require 'minitest/autorun'
require 'minitest/pride'
require './lib/codemaker'

class CodemakerTest < Minitest::Test
  def test_it_exists
    codemaker = Codemaker.new
    assert_instance_of Codemaker, codemaker
  end

  def test_it_starts_with_a_color_array
    codemaker = Codemaker.new
    codemaker.colors
  end

  def test_randomizing_code
    codemaker = Codemaker.new
    assert_equal false, codemaker.randomize == codemaker.colors
    # not sure how to test this. It will come back true sometimes.
  end
end
