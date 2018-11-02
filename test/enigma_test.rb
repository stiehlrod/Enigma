require 'date'
require './lib/enigma'
require './test/test_helper'

class EnigmaTest < Minitest::Test
  enigma = Enigma.new
  #=> #<Enigma:0x00007ff90f24cb78...>

  # encrypt a message with a key and date
  enigma.encrypt("hello world", "02715", "040895")
  #=>
  #   {
  #     encryption: "keder ohulw",
  #     key: "02715",
  #     date: "040895"
  #   }

  # decrypt a message with a key and date

  enigma.decrypt("keder ohulw", "02715", "040895")
  #=>
  #   {
  #     decryption: "hello world",
  #     key: "02715",
  #     date: "040895"
  #   }

  # encrypt a message with a key (uses today's date)
  encrypted = enigma.encrypt("hello world", "02715")
  #=> # encryption hash here

  #decrypt a message with a key (uses today's date)

  enigma.decrypt(encrypted, "02715")
  #=> # decryption hash here

  # encrypt a message (generates random key and uses today's date)
  enigma.encrypt("hello world")
  #=> # encryption hash here
end
