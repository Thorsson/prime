require_relative 'error/missing_integer_exception'
require_relative 'core_ext/integer'
require_relative 'core_ext/array'
require_relative 'multiplication_printer'

class PrimeNumbers
  attr_accessor :prime_numbers

  @@prime_numbers = []

  def initialize
    @prime_numbers = []
  end

  def generate number_of_primes
    unless number_of_primes.class == Fixnum && number_of_primes > 0
      raise MissingIntegerException, "#{number_of_primes} is not an positive integer"
    end

    @prime_numbers = []

    candidate = 1
    until @prime_numbers.count == number_of_primes
      @prime_numbers << candidate if self.prime?(candidate)
      candidate += 1
    end

    @prime_numbers
  end

  def print_multiplication_table
    puts MultiplicationPrinter.prepare_print(@prime_numbers)
  end

  def prime? number
    return false if number < 2
    return true if @@prime_numbers.include? number

    if @@prime_numbers.any? {|prime| number % prime == 0 }
      return false
    else
      if number.is_prime?
        @@prime_numbers << number
        return true
      else
        return false
      end
    end
  end
end