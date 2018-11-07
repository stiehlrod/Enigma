require './lib/enigma'

class Decrypt < Enigma

  def initialize
  end

  def decrypt_translate(char, shift_amt)
    new_ind = character_map.index(char) - shift_amt
    character_map[new_ind % 27]
  end

  def prepare_for_decryption(message, key = get_random_key, date_string = today)
    shift = make_shift_hash(date_string, key)
    message.downcase.chars.map.with_index do |char, i|
      decrypt_translate(char, shift[i % 4])
    end.join
  end

  def decrypt(message, key = get_random_key, date_string = today)
    message = prepare_for_decryption(message, key, date_string)
    return_hash = {}
    return_hash[:decryption] = message
    return_hash[:key] = key
    return_hash[:date] = date_string
    return_hash
  end
end
