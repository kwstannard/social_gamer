require '~/social_gamer/lib/instance.rb'

class Person < Instance
  attr_accessor :name_first, :name_last, :name_middle,
              :location

  def move_to(new_place)
    @location = new_place
  end

  def to_s
    "#{name_first} #{name_last}"
  end
end
