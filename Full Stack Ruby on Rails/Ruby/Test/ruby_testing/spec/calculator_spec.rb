#spec/calculator_spec.rb
require './lib/calculator'
RSpec.describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end
    
    
    it "returns the sum of two or more numbers" do
      cal=Calculator.new
      expect(cal.add(5,2,2)).to eql(9)
    end
  end
end
