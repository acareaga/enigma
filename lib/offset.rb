require 'pry'
require 'date'

class Offset

  attr_reader :date, :offset

  def initialize
    @date = date
    @offset = offset
  end

  def date
    date = Date.today.strftime("%d%m%y")
  end

  def offset
    square = (date.to_i) ** 2
    offset = square.to_s[-4..-1]
  end

  def offset_position_a
    offset[0]
  end

  def offset_position_b
    offset[1]
  end

  def offset_position_c
    offset[2]
  end

  def offset_position_d
    offset[3]
  end

end

# offset_a = offset[0]
# offset_b = offset[1]
# offset_c = offset[2]
# offset_d = offset[3]
