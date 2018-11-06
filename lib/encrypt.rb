require 'pry'
require './lib/enigma'
binding.pry

file_message = File.open(ARGV[0])
rd = message.read
enigma = Enigma.new(rd,key,date_string,"")
encrypt(message)
