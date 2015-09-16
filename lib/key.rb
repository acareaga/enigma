class Key

  attr_reader :key, :generate_key

  def initialize
    @key = generate_key # [1,2,3,4,5]
  end

  def generate_key
    [rand(0..9), rand(0..9), rand(0..9), rand(0..9), rand(0..9)]
  end

  def rotation_a
    key[0].to_s + key[1].to_s
  end

  def rotation_b
    key[1].to_s + key[2].to_s
  end

  def rotation_c
    key[2].to_s + key[3].to_s
  end

  def rotation_d
    key[3].to_s + key[4].to_s
  end

  def position
    [rotation_a, rotation_b, rotation_c, rotation_d]
  end

end

# key = Key.new
# p key
# p key.rotation_a
# p key.rotation_b
# p key.rotation_c
# p key.rotation_d
