require "spec_helper"

describe MultiplicationPrinter do
  let(:array) { [2, 3, 5] }
  subject(:multiplication_printer) { MultiplicationPrinter.new(array) }

  specify { to respond_to(:spacer_size) }
  specify { to respond_to(:print_item) }
  specify { to respond_to(:build_header) }
  specify { to respond_to(:build_header_line) }
  specify { to respond_to(:build_row) }
  specify { to respond_to(:build_output) }

  before do
    @output = ""
    @output << "    |  2  3  5\n"
    @output << "----+---------\n"
    @output << "  2 |  4  6 10\n"
    @output << "  3 |  6  9 15\n"
    @output << "  5 | 10 15 25"
  end

  it 'gives a proper size for spaces based on the array' do
    expect(subject.spacer_size).to eq(3)
  end

  context "add space indention" do
    it 'adds proper space indention based on 3' do
      expect(subject.print_item(3)).to eq("  3")
    end

    it 'adds proper space indention based on 25' do
      expect(subject.print_item(25)).to eq(" 25")
    end
  end

  it 'builds a header from array' do
    expect(subject.build_header).to eq("    |  2  3  5")
  end

  it 'creates a proper header line' do
    expect(subject.build_header_line).to eq("----+---------")
  end

  context "building number row" do
    it 'build a row for 3' do
      expect(subject.build_row(3)).to eq("  3 |  6  9 15")
    end

    it 'build a row for 5' do
      expect(subject.build_row(5)).to eq("  5 | 10 15 25")
    end
  end

  it 'builds a multiplication table for the array' do
    expect(subject.build_output).to eq(@output)
  end

  it "should print multiplication table for array" do
    expect(MultiplicationPrinter.prepare_print(array)).to eq(@output)
  end
end