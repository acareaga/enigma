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

  def offset_position
    offset_a = offset[0]
    offset_b = last_four[1]
    offset_c = last_four[2]
    offset_d = last_four[3]
  end

end
