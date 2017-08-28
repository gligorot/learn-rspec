require "stock_picker"

describe ".stock_picker" do
	it "returns [1, 4] when given ary [17,3,6,9,15,8,6,1,10]" do
	  expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eql([1, 4])
	end
  it "returns [0, 3] when given ary [0, 1, 1, 10, 1, 1, 0 , 1, 1]" do
    expect(stock_picker([0, 1, 1, 10, 1, 1, 0 , 1, 1])).to eql([0, 3])
  end
  it "returns nil when given ary []" do
    expect(stock_picker([])).to eql(nil)
  end
end
