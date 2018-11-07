require 'date'
require './lib/enigma'
require './test/test_helper'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt  =Encrpyt.new
    assert_instance_of Encrpyt, encrypt
  end
end
