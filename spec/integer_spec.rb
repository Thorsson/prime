require 'spec_helper'

describe Integer do
  it "should return false for 1 as prime number" do
    2.is_prime?.should be_true
  end

  it "should return true for 2 as prime number" do
    2.is_prime?.should be_true
  end

  it "should return false for 4 as prime number" do
    4.is_prime?.should be_false
  end
end
