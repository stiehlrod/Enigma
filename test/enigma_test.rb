require 'date'
require './lib/enigma'
require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
    #=> #<Enigma:0x00007ff90f24cb78...>
  end
  # encrypt a message with a key and date
  def test_it_is
    skip
    enigma.encrypt("hello world", "02715", "040895")
  #=>
  #   {
  #     encryption: "keder ohulw",
  #     key: "02715",
  #     date: "040895"
  #   }

  # decrypt a message with a key and date
  end
  def test_it_is
    skip
    enigma.decrypt("keder ohulw", "02715", "040895")
  #=>
  #   {
  #     decryption: "hello world",
  #     key: "02715",
  #     date: "040895"
  #   }
  end
  # encrypt a message with a key (uses today's date)
  def test_it_is
    skip
    encrypted = enigma.encrypt("hello world", "02715")
  #=> # encryption hash here

  #decrypt a message with a key (uses today's date)
  end
  def test_it_is
    skip
    enigma.decrypt(encrypted, "02715")
  #=> # decryption hash here

  # encrypt a message (generates random key and uses today's date)
  end
  def test_it_is
    skip
    enigma.encrypt("hello world")
  #=> # encryption hash here
  end
end
