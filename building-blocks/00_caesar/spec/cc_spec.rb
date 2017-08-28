require 'cipher'

describe ".caesar_cipher" do

	it "returns 'fgh' when given 'abc' and factor 5" do
    expect(caesar_cipher("abc", 5)).to eql("fgh")
  end

  it "returns 'FgH!' when given 'AbC!' and factor 5" do
  	expect(caesar_cipher('AbC!', 5)).to eql("FgH!")
  end

  it "returns 'ABC}' when given 'XYZ}' and factor 3" do
    expect(caesar_cipher('XYZ}', 3)).to eql("ABC}")
  end

end
