class Array
  def print_multiplication_table
    primes = PrimeNumbers.new
    primes.prime_numbers = self
    primes.print_multiplication_table
  end
end