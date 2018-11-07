require 'date'
require './lib/decrypt'
require './test/test_helper'

class DecryptTest < Minitest::Test

  def test_it_exists
    decrypt = Decrypt.new
    assert_instance_of Decrypt, decrypt
  end

  def test_it_can_prepare_for_decrpyt
    decrypt = Decrypt.new
    expected = 'hello world'
    actual = decrypt.prepare_for_decryption("keder ohulw", "02715", "040895")
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
end
