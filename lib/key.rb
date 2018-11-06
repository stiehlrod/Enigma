class Key

  def initialize
  end

  def get_random_key
    random = rand(11111...99999).to_s
    random.split(//)
  end
  def get_keys_array(random_array)
    new_array = []
    random_array.each_cons(2) do |con|
      new_array << con
    end
    keys = new_array.map do |first, second|
      first+second
    end
    keys.map do |num|
        num.to_i
    end
  end

end
