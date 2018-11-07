module Key

  def get_random_key
    rand(11111...99999).to_s
  end

  def make_key_array(key = get_random_key)
    key_ints = key.chars.map.with_index do |char, i|
      key[i..i+1].to_i
    end
    key_ints.pop
    key_ints
  end

end
