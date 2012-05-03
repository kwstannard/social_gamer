require '~/social_gamer/lib/instance.rb'

class Person < Instance
  attr_reader :name_first, :name_last, :name_middle,
              :location
  set_mtm_relations :friends, :games, :events

  def move_to(new_place)
    @location = new_place
  end

  def to_s
    "#{name_first} #{name_last}"
  end
end
