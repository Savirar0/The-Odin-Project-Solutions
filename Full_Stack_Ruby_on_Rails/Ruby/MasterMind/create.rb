class Create
  attr_accessor :comp, :plyr, :colors

  def initialize()
    @colors=["green","red","white","blue","yellow","black"]
    @comp = Array.new(4) { colors.sample }
  end
end