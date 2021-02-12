class Turn
  attr_reader :codemaker, :codebreaker
  def initialize(codemaker, codebreaker)
    @codemaker = codemaker
    @codebreaker = codebreaker
  end
end
