require 'pry'
require './lib/enigma'
require './lib/decrypt'
require './lib/key'
require 'date'


message_txt, encrypted_txt = ARGV
handle = File.open(encrypted_txt, 'r')
incoming = handle.read
incoming.chomp!
handle.close

decrypt = Decrypt.new
decrypted = decrypt.decrypt(incoming)

writer = File.open(message_txt, 'w')
writer.write(decrypted[:decryption])
p "Created 'cracked_txt' with the key #{decrypted[:key]} and the date #{decrypted[:date]}."

writer.close

# ruby lib/cl_crack.rb encrypted.txt message.txt
