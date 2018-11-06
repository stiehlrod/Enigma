require 'date'
require './lib/enigma'
require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new("hello world", "02715", "040895")
  end

  def test_it_exists
    skip
    skip
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_convert_a_date_string_to_key
    skip
    skip
    actual = @enigma.convert_date("040895")
    assert_equal ["1", "0", "2", "5"], actual
  end

  def test_it_can_make_date_array
    skip
    skip
    expected = [1,0,2,5]
    actual = @enigma.make_date_array("040895")
    assert_equal expected, actual
  end

  def test_it_can_make_a_hash
    skip
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
    skip
    expected = 'keder ohulw'
    actual = @enigma.prepare_for_encryption("hello world", "02715", "040895", "encrypt")
    assert_equal expected, actual
  end

  def test_it_can_encrypt_a_message_with_key_and_date
    skip
    actual = @enigma.encrypt("hello world", "02715", "040895", "encrypt")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, actual
  end

  def test_it_can_decrypt_a_string
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")

    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, actual
  end



  # encrypt a message with a key (uses today's date)
  def test_it_can_encrypt_with_todays_date
    enigma = Enigma.new('','','')
    enigma.stub :today, "040895" do
      actual = enigma.encrypt("hello world", "02715")
      #=> # encryption hash here
      expected = {
          decryption: "hello world",
          key: "02715",
          date: "110618"
        }

      assert_equal expected, actual
    end
    #decrypt a message with a key (uses today's date)
  end

  def test_it_can_generate_random_key_and_use_todays_date
    skip
    enigma.decrypt(encrypted, "02715")
  #=> # decryption hash here

  # encrypt a message (generates random key and uses today's date)
  end


end
