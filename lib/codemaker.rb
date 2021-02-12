class Codemaker
  attr_reader :colors, :code
  def initialize
    @colors = ["R", "G", "B", "Y"]
    @code = []
  end

  def randomize
    4.times do
      @code << colors.sample
    end
    @code.join
    # will have to clear code array after turn or make sure
    # method does not get called more than once
  end

  # def indclude?
end
