require 'date'
require './lib/encrypt'
require './test/test_helper'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new
    assert_instance_of Encrypt, encrypt
  end

  def test_it_can_prepare_for_encrpyt
    encrypt = Encrypt.new
    expected = 'keder ohulw'
    actual = encrypt.prepare_for_encryption("hello world", "02715", "040895")
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
end
