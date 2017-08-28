require "advblocks"


module Enumerable

  describe "#my_each" do
    before {@array = [1,2,3,4,5,6]}

    context "with no block given" do
      it "returns self" do
        expect(@array.my_each).to eql(@array)
      end
    end

    context "with block given" do
      it "returns the correct sum of all ary elements" do
        sum = 0
        @array.my_each {|elem| sum += elem}
        expect(sum).to eql(21)
      end
    end
  end

  describe "#my_select" do
    before {@array = [1,2,3,4,5,6]}

    context "with no block given" do
      it "returns self" do
        expect(@array.my_select).to eql(@array)
      end
    end

    context "with block given" do
      it "returns correct array length when block scans for integers" do
        expect((@array.my_select{|elem|elem.is_a? Integer}).length).to eql(6)
      end

      it "returns an empty array when there are no matches" do
        expect((@array.my_select{|elem| elem.is_a? String}).length).to eql(0)
      end
    end
  end

  describe "#my_all?" do
    before {@array = [1,2,3,4,5,6]}

    context "with no block given" do
      it "returns true" do
        expect(@array.my_all?).to be true
      end
    end

    context "with block given" do
      it "returns false on empty block" do
        expect(@array.my_all? {}).to be false
      end

      it "returns true when all elements really are integers" do
        expect(@array.my_all? {|elem| elem.is_a? Integer}).to be true
      end

      it "returns false when all elements don\'t fit the block requirements" do
        expect(@array.my_all? {|elem| elem < 5}).to be false
      end

    end
  end

  describe "#my_count" do
    before {@array = [1,2,3,4,5,6]}

    context "with no block given" do
      context "with nothing given" do
        it "returns correct ary length" do
          expect(@array.my_count).to eql(@array.length)
        end
      end

      context "with object given in ()" do
        it "returns the count of items inside that match object" do
          expect(@array.my_count(3)).to eql(1)
        end
      end
    end

    context "with block given" do
      it "returns 0 when block is empty" do
        expect(@array.my_count {}).to eql(0)
      end

      it "returns the count of items that match the block requirement" do
        expect(@array.my_count {|elem| elem > 3}).to eql(3)
      end
    end
  end

  describe "#my_map" do
    before {@array = [1,2,3,4,5,6]}

    context "no block given" do
      it "returns self" do
        expect(@array.my_map).to eql(@array)
      end
    end

    context "block given" do
      it "returns an updated array based on the block" do
        expect(@array.my_map {|elem| elem*2}).to eql([2,4,6,8,10,12])
      end
    end
  end

  describe "#my_inject" do
    before {@array = [1,2,3,4,5,6]}


    context "no block given" do
      it "returns sum when given '+' as symbol" do
        expect(@array.my_inject(:+)).to eql(21)
      end

      it "returns sum + initial when given initial and '+'" do
        expect(@array.my_inject(9, :+)).to eql(30)
      end
    end

    context "block given" do
      it "returns the correct sum" do
        expect(@array.my_inject{|sum, x| sum += x}).to eql(21)
      end

      it "returns the correct multiply when given initial of 1 and multiply block" do
        expect(@array.my_inject(1){|mply, x| mply *= x}).to eql(720)
      end
    end
  end
end
