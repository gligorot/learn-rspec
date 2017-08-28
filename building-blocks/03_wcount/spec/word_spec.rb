require "word_counter"

describe ".histogram" do
  it "returns word count when given a sentence" do
    expect(histogram("aa aa a")).to eql ([["aa", 2], ["a", 1]])
  end

  it "returns an empty array when given empty string" do
    expect(histogram("")).to eql ([])
  end
end
