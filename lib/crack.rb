# def regenerate_key
#   position_a = key.to_s[0] + key.to_s[1]
#   position_b = key.to_s[1] + key.to_s[2]
#   position_c = key.to_s[2] + key.to_s[3]
#   position_d = key.to_s[3] + key.to_s[4]
#   @key_position = [position_a, position_b, position_c, position_d]
#   create_decryption_rotation
# end


# def reverse_rotation
#   counter = (position.length % 4) - 1
#   position.each do |num|
#     @decrypted_position << num - rotation[counter]
#     counter = (counter - 1) % rotation.length
#     binding.pry
#   end
#   convert_to_plain_text
# end
