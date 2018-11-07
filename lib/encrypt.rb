require './lib/enigma'

class Encrypt < Enigma

  def initialize
  end

  def encrypt_translate(char, shift_amt)
    new_ind = character_map.index(char) + shift_amt
    character_map[new_ind % 27]
  end
end
