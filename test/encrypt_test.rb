
# capture input text: ruby ./lib/encrypt.rb message.txt encrypted.txt
# generate key
# generate offset
# pass key and offset into encryptor
# rotate on charactermap for plain text character using the key + offset

# Four characters are encrypted at a time.
# The first character is rotated forward by the "A" rotation plus the "A offset"
# The second character is rotated forward by the "B" rotation plus the "B offset"
# The third character is rotated forward by the "C" rotation plus the "C offset"
# The fourth character is rotated forward by the "D" rotation plus the "D offset"

# save encrypted letter in encrypted array
# repeat process until ..end.. is reached
# write output file (encrypted.txt) with encrpyed array
# display: Created 'encrypted.txt' with the key 82648 and date 030415

# repeat process with decrypt and crack.rb
