require 'pry'
require './lib/enigma'
require './lib/decrypt'


message_txt, encrypted_txt = ARGV
handle = File.open(encrypted_txt, 'r')
incoming = handle.read
incoming.chomp!
handle.close

decrypt = Decrypt.new
decrypted = decrypt.decrypt(incoming,"82648","240818")

writer = File.open(message_txt, 'w')
writer.write(decrypted[:decryption])
p "Created 'decrypted_txt' with the key #{decrypted[:key]} and the date #{decrypted[:date]}."

writer.close

# ruby lib/cl_decrypt.rb encrypted.txt message.txt
