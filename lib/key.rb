class Key

  attr_accessor :key

  def initialize
    @key = generate_key
  end

  def key
    @key
  end

  def generate_key
    @key = [rand(0..9), rand(0..9), rand(0..9), rand(0..9), rand(0..9)]
  end

  def rotation_A
    @key[0..1]
  end

  def rotation_B
    @key[1..2]
  end

  def rotation_C
    @key[2..3]
  end

  def rotation_D
    @key[3..4]
  end

end

# key = Key.new
# key = key.generate_key
# p key
# p key[0..1]
# p key[1..2]
# p key[2..3]
# p key[3..4]
