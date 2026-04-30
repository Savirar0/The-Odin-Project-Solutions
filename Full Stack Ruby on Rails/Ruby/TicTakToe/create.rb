class Create
  attr_accessor :grid
  def initialize()
    @grid = Array.new(3) { Array.new(3, nil) }
  end

  def display()
    grid.each do |row|
      p row
    end
  end
end