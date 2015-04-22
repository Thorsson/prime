require 'spec_helper'

describe PrimeNumbers do
  subject(:prime_numbers) { PrimeNumbers.new }

  specify { should respond_to(:generate) }
  specify { should respond_to(:print_multiplication_table) }
  specify { should respond_to(:prime?) }

  it "should return first 10 prime numbers" do
    expect(prime_numbers.generate(10)).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
  end

  it "should raise exception for non positive integer number of primes" do
    expect do
      prime_numbers.generate(-5)
    end.to raise_error(MissingIntegerException, '-5 is not an positive integer')
  end

  it "should raise exception for supplying string as argument" do
    expect do
      prime_numbers.generate('WRONG')
    end.to raise_error(MissingIntegerException, 'WRONG is not an positive integer')
  end

  it "should return true for checking prime number 13" do
    expect(prime_numbers.prime?(13)).to be_true
  end

  it "should return true for checking prime number 12" do
    expect(prime_numbers.prime?(12)).to be_false
  end

  it "should print multiplication table for first 3 primes" do
    output = ""
    output << "    |  2  3  5\n"
    output << "----+---------\n"
    output << "  2 |  4  6 10\n"
    output << "  3 |  6  9 15\n"
    output << "  5 | 10 15 25\n"

    expect(capture_stdout do
      prime_numbers.generate(3).print_multiplication_table
    end.string).to eq(output)
  end
end