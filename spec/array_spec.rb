require 'spec_helper'

describe Array do
  let(:array) { [2, 3, 5] }

  it "should print multiplication table for array elements" do
    output = ""
    output << "    |  2  3  5\n"
    output << "----+---------\n"
    output << "  2 |  4  6 10\n"
    output << "  3 |  6  9 15\n"
    output << "  5 | 10 15 25\n"

    expect(capture_stdout do
      array.print_multiplication_table
    end.string).to eq(output)
  end
end