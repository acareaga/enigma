require 'date'

class Offset

  attr_reader :date, :offset, :position

  def initialize
    @date = date
    @offset = offset
    @position = position
  end

  def date
    date = Date.today.strftime("%d%m%y")
  end

  def offset
    square = (date.to_i) ** 2
    offset = square.to_s[-4..-1]
  end

  def position_a
    offset[0].to_i
  end

  def position_b
    offset[1].to_i
  end

  def position_c
    offset[2].to_i
  end

  def position_d
    offset[3].to_i
  end

  def position
    [offset[0].to_i, offset[1].to_i, offset[2].to_i, offset[3].to_i]
  end
end
