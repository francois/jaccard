require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe Jaccard do
  attr_reader :a, :b, :c

  before do
    @a = ["likes:jeans", "likes:blue"]
    @b = ["likes:jeans", "likes:women", "likes:red"]
    @c = ["likes:women", "likes:red"]
  end

  describe "#coefficient" do
    it "calculates the coefficient on Array instances" do
      expect(Jaccard.coefficient(a, b)).to eq(0.25)
      expect(Jaccard.coefficient(a, c)).to eq(0.0)
      expect(Jaccard.coefficient(b, c)).to eq(2.0 / 3.0)
    end

    it "calculates the coefficient on Set instances" do
      expect(Jaccard.coefficient(a.to_set, b.to_set)).to eq(0.25)
      expect(Jaccard.coefficient(a.to_set, c.to_set)).to eq(0.0)
      expect(Jaccard.coefficient(b.to_set, c.to_set)).to eq(2.0 / 3.0)
    end

    it do
      obj_without_intersection_method = ""
      expect { Jaccard.coefficient(obj_without_intersection_method, []) }.to raise_error(ArgumentError)
    end

    it do
      obj_without_union_method = Object.new
      def obj_without_union_method.&(other)
        self
      end

      expect { Jaccard.coefficient(obj_without_union_method, []) }.to raise_error(ArgumentError)
    end
  end

  describe "#distance" do
    it "calculates the distance as the inverse of the coefficient" do
      expect(Jaccard.distance(a, b)).to eq(1.0 - Jaccard.coefficient(a, b))
      expect(Jaccard.distance(a, c)).to eq(1.0 - Jaccard.coefficient(a, c))
      expect(Jaccard.distance(b, c)).to eq(1.0 - Jaccard.coefficient(b, c))
    end
  end

  describe "#closest_to" do
    it "minimizes the distance" do
      expect(Jaccard.closest_to(a, [b, c])).to be_equal(b)
      expect(Jaccard.closest_to(b, [a, c])).to be_equal(c)
    end
  end

  describe "#best_match" do
    it "finds the best match given a set of entries" do
      expect(Jaccard.best_match([a, b, c])).to eq([b, c])
    end
  end
end
