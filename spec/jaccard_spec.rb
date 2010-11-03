require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "set"

describe Jaccard do
  attr_reader :a, :b, :c

  before do
    @a = ["likes:jeans", "likes:blue"]
    @b = ["likes:jeans", "likes:women", "likes:red"]
    @c = ["likes:women", "likes:red"]
  end

  describe "#coefficient" do
    it "should calculate the coefficient on Array instances" do
      Jaccard.coefficient(a, b).should == 0.25
      Jaccard.coefficient(a, c).should == 0.0
      Jaccard.coefficient(b, c).should == (2.0/3.0)
    end

    it "should calculate the coefficient on Set instances" do
      Jaccard.coefficient(a.to_set, b.to_set).should == 0.25
      Jaccard.coefficient(a.to_set, c.to_set).should == 0.0
      Jaccard.coefficient(b.to_set, c.to_set).should == (2.0/3.0)
    end

    it do
      obj_without_intersection_method = ""
      lambda { Jaccard.coefficient(obj_without_intersection_method, []) }.should raise_error(ArgumentError)
    end

    it do
      obj_without_union_method = Object.new
      def obj_without_union_method.&(other); self; end

      lambda { Jaccard.coefficient(obj_without_union_method, []) }.should raise_error(ArgumentError)
    end
  end

  describe "#distance" do
    it "should calculate the distance as the inverse of the coefficient" do
      Jaccard.distance(a, b).should == (1.0 - Jaccard.coefficient(a, b))
      Jaccard.distance(a, c).should == (1.0 - Jaccard.coefficient(a, c))
      Jaccard.distance(b, c).should == (1.0 - Jaccard.coefficient(b, c))
    end
  end

  describe "#closest_to" do
    it "should minimize the distance" do
      Jaccard.closest_to(a, [b, c]).should == b
      Jaccard.closest_to(b, [a, c]).should == c
    end
  end

  describe "#best_match" do
    it "should find the best match given a set of entries" do
      Jaccard.best_match([a, b, c]).should == [b, c]
    end
  end
end
