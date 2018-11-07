require 'pry'
require './lib/enigma'
require './lib/key'
# binding.pry

handle = File.open(ARGV[0], 'r')
incoming = handle.read
handle.close
# key = @key.get_random_key
enigma = Enigma.new
encrypted = enigma.encrypt(incoming,key,date_string)

writer = File.open(ARGV[1], 'w')
writer.write(encrypted)

writer.close

# ruby lib/encrypt.rb message.txt encrypted.txt
