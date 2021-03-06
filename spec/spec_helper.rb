require 'stringio'
require_relative '../lib/prime_numbers.rb'
require_relative '../lib/error/missing_integer_exception'

RSpec.configure do |c|
  c.alias_example_to :expect_it
end

RSpec::Core::MemoizedHelpers.module_eval do
  alias to should
  alias to_not should_not
end

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