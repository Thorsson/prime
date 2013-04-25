require 'spec_helper'

describe PrimeNumbers do
  subject(:prime_numbers) { PrimeNumbers.new }

  specify { should respond_to(:generate) }
  specify { should respond_to(:print_multiplication_table) }
  specify { should respond_to(:prime?) }

  it "should return first 10 prime numbers" do
    prime_numbers.generate(10).should eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
  end

  it "should raise exception for non positive integer number of primes" do
    lambda do  
      prime_numbers.generate(-5)
    end.should raise_error(MissingIntegerException, '-5 is not an positive integer')
  end

  it "should raise exception for supplying string as argument" do
    lambda do  
      prime_numbers.generate('WRONG')
    end.should raise_error(MissingIntegerException, 'WRONG is not an positive integer')
  end

  it "should return true for checking prime number 13" do
    prime_numbers.prime?(13).should be_true
  end

  it "should return true for checking prime number 12" do
    prime_numbers.prime?(12).should be_false
  end

  it "should print multiplication table for first 3 primes" do
    capture_stdout do 
      prime_numbers.generate(3).print_multiplication_table
    end.string.should eq("\t2\t3\t5\n2\t4\t6\t10\n3\t6\t9\t15\n5\t10\t15\t25\n")
  end
end

describe Integer do
  it "should return true for 2 as prime number" do
    2.is_prime?.should be_true
  end

  it "should return false for 4 as prime number" do
    4.is_prime?.should be_false
  end
end

describe Array do
  let(:array) { [2, 3, 5] }

  it "should print multiplication table for array elements" do
    capture_stdout do 
      array.print_multiplication_table
    end.string.should eq("\t2\t3\t5\n2\t4\t6\t10\n3\t6\t9\t15\n5\t10\t15\t25\n")
  end
end