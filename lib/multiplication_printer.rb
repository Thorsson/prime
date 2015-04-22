class MultiplicationPrinter
  def initialize numbers
    @numbers = numbers
  end

  def spacer_size
    @spacer ||= (@numbers.last ** 2).to_s.length + 1
  end

  def spaces length = 1, symbol = " "
    symbol * length
  end

  def print_item number
    size = spacer_size - (number < 10 ? 1 : number.to_s.length)
    "#{spaces(size)}#{number}"
  end

  def build_header
    numbers = @numbers.map{|number| print_item(number)}.join
    "#{spaces(spacer_size + 1)}|#{numbers}"
  end

  def build_header_line
    "#{spaces(spacer_size + 1, '-')}+#{spaces(spacer_size * @numbers.count, '-')}"
  end

  def build_row item
    output = "#{print_item(item)} |"
    output << @numbers.map{|number| print_item(number * item)}.join
  end

  def build_output
    output = [build_header, build_header_line]
    @numbers.each do |number|
      output << build_row(number)
    end
    output.join("\n")
  end

  def self.prepare_print numbers
    self.new(numbers).build_output
  end
end