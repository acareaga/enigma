require 'pry'
require 'date'

class Offset

  attr_reader :date, :offset

  def initialize
    @date = date
    @offset = offset
  end

  def date
    day = Date.today.day
      if day < 10
        day = "0#{day}"
      else
        day = "#{day}"
      end
    month = Date.today.month
      if month < 10
        month = "0#{month}"
      else
        month = "#{month}"
      end
    year = Date.today.year.to_s[-2..-1]
    date = "#{day}#{month}#{year}"
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
