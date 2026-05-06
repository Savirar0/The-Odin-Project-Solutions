require './lib/game'

RSpec.describe Game do
  describe "#play" do
    it "Test1" do
      g1=Game.new
      g1.grid=[["-","x","x","x","x","-","-"],
            ["-","x","-","-","o","-","-"],
            ["-","o","o","-","o","-","o"],
            ["-","-","-","-","-","-","-"],
            ["-","-","-","-","-","-","-"],
            ["-","-","-","-","-","-","-"]]
      expect(g1.play()).to eql("You win!")
    end
  end
end