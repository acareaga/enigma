class Key

  attr_accessor :key, :generate_key  # => nil

  def initialize
    @key = key
    @generate_key = generate_key
  end                             # => :initialize

  def generate_key
    # key = [rand(0..9), rand(0..9), rand(0..9), rand(0..9), rand(0..9)]
    key = [12345]
  end                                                                   # => :generate_key

  def rotation_a
    key[0..1]
  end             # => :rotation_a

  def rotation_b
    key[1..2]
  end             # => :rotation_b

  def rotation_c
    key[2..3]
  end             # => :rotation_c

  def rotation_d
    key[3..4]
  end             # => :rotation_d

end  # => :rotation_d

# key = Key.new
# key = key.generate_key
# p key
# p key[0..1]
# p key[1..2]
# p key[2..3]
# p key[3..4]
