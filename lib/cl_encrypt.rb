require 'pry'
require './lib/enigma'
require './lib/encrypt'

message_txt, encrypted_txt = ARGV
handle = File.open(message_txt, 'r')
incoming = handle.read
incoming.chomp!
handle.close

encrypt = Encrypt.new
encrypted = encrypt.encrypt(incoming,"82648","240818")

writer = File.open(encrypted_txt, 'w')
writer.write(encrypted[:encryption])
p "Created 'encrypted_txt' with the key #{encrypted[:key]} and the date #{encrypted[:date]}."
writer.close

# ruby lib/cl_encrypt.rb message.txt encrypted.txt
