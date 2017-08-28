require "substrings"

describe ".substrings" do
  it "returns a list of strings and substrings" do
    expect(substrings("Howdy partner, sit down! How's it going?")).to eql({"down"=>1, "go"=>1, "going"=>1, "how"=>2, "howdy"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1})
  end
  it "returns a list of strings and substrings 2" do
    expect(substrings("Howdy I")).to eql({"how"=>1, "howdy"=>1, "i"=>1})
  end
end
