#!/usr/bin/env ruby

# $:.unshift File.join(File.dirname(__FILE__))
require_relative "lib/prime_numbers.rb"
require_relative "lib/error/missing_integer_exception.rb"

begin
  NUMBER_OF_PRIMES = ARGV.first.nil? ? 10 : Integer(ARGV.first)
rescue 
  NUMBER_OF_PRIMES = 10
end

if NUMBER_OF_PRIMES.class == Fixnum &&
   NUMBER_OF_PRIMES > 0
  primes = PrimeNumbers.new
  primes.generate(NUMBER_OF_PRIMES).print_multiplication_table
else
  raise MissingIntegerException, "#{NUMBER_OF_PRIMES} is not an positive integer"
end