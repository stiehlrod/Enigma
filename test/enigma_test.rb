require 'date'
require './lib/enigma'
require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new("hello world", "02715", "040895")
  end

  def test_it_exists
    skip
    assert_instance_of Enigma, @enigma
    #=> #<Enigma:0x00007ff90f24cb78...>
  end

  def test_it_can_convert_a_date_string_to_key
    skip
    actual = @enigma.convert_date("040895")
    assert_equal ["1", "0", "2", "5"], actual
  end

  def test_keys_array_can_return_an_array
    skip
    actual = @enigma.get_keys_array(["1","2","3","4","5"])
    assert_equal [12,23,34,45], actual
  end

  def test_it_can_make_date_array
    skip
    expected = [1,0,2,5]
    actual = @enigma.make_date_array("040895")
    assert_equal expected, actual
  end

  def test_it_can_make_key_array
    skip
    expected = [02,27,71,15]
    actual = @enigma.make_key_array("02715")
    assert_equal expected, actual
  end

  def test_it_can_make_a_hash
    actual = @enigma.make_shift_hash("040895", "02715")
    expected = {
                0 => 3,
                1 => 27,
                2 => 73,
                3 => 20
              }
    assert_equal expected, actual
  end

  def test_it_can_prepare_for_encrpyt
    expected = 'keder ohulw'
    actual = @enigma.prepare_for_encryption("hello world", "02715", "040895", "encrypt")
    assert_equal expected, actual
  end

  def test_it_can_encrypt_a_message_with_key_and_date
    actual = @enigma.encrypt("hello world", "02715", "040895")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, actual
  end

  def test_it_can_decrypt_a_string
    actual = @enigma.encrypt("keder ohulw", "02715", "040895", "decrypt")
    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, actual
  end

  # encrypt a message with a key (uses today's date)
  def test_it_can_decrypt_with_todays_date
    skip
    encrypted = enigma.encrypt("hello world", "02715")
    #=> # encryption hash here

    #decrypt a message with a key (uses today's date)
  end

  def test_it_can_generate_random_key_and_use_todays_date
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
