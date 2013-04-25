require_relative 'error/missing_integer_exception'

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
    table = "\t#{@prime_numbers.join("\t")}\n"
    @prime_numbers.each do |row_number|
      row = @prime_numbers.map {|x| x * row_number}
      table << "#{row_number}\t#{row.join("\t")}\n"
    end
    puts table
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

class Integer < Numeric
  def is_prime?
    return false if self <= 1
    2.upto(Math.sqrt(self).to_i) do |x|
        return false if self % x == 0
    end 
    true
  end
end

class Array
  def print_multiplication_table
    primes = PrimeNumbers.new
    primes.prime_numbers = self
    primes.print_multiplication_table 
  end
end