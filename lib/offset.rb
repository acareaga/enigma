require 'pry'
require 'date'

class Offset

  attr_reader :date, :offset_a, :offset_b, :offset_c, :offset_d

  def initialize
    @date = date
    @offset_a = offset_a
    @offset_b = offset_b
    @offset_c = offset_c
    @offset_d = offset_d
  end

  def date
    today = Date.today
    date = "#{today.day}0#{today.month}#{today.year - 2000}"
  end

  def offset
    square = (date.to_i) ** 2
    last_four = square.to_s[-4..-1]
  end

  def offset_abcd
    offset_a = last_four[0]
    offset_b = last_four[1]
    offset_c = last_four[2]
    offset_d = last_four[3]
  end

end
