module Key

  def get_random_key
    rand(11111...99999).to_s
  end

  def make_key_array(key = get_random_key)
    key_ints = key.chars.map.with_index { |char, i| key[i..i+1].to_i }
    key_ints.pop
    key_ints
  end

end
