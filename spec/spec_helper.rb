require 'stringio'
require_relative '../lib/prime_numbers.rb'
require_relative '../lib/error/missing_integer_exception'
 
module Kernel
 
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
 
end