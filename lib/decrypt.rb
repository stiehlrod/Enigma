require 'pry'
require './lib/enigma'
require './lib/key'
# binding.pry

handle = File.open(ARGV[1], 'r')
incoming = handle.read
handle.close
# key = @key.get_random_key
enigma = Enigma.new
decrypted = enigma.decrypt(incoming,key,date_string)

writer = File.open(ARGV[0], 'w')
writer.write(decrypted)

writer.close

# ruby lib/decrypt.rb message.txt encrypted.txt
