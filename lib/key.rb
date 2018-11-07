module Key

  attr_reader :random_key

  def initialize
  end

  def get_random_key
    rand(11111...99999).to_s
    # random.split(//)
  end

  # def get_keys_array
  #   random_array = get_random_key
  #   new_array = []
  #   random_array.each_cons(2) do |con|
  #     new_array << con
  #   end
  #   keys = new_array.map do |first, second|
  #     first+second
  #   end
  #   keys.map do |num|
  #       num.to_i
  #   end
  # end

end
