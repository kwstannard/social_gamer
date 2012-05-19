require '~/social_gamer/lib/instance.rb'

class Event < Instance
  attr_reader :name, :location, :date_time

  def move_to(new_place)
    @location = new_place
  end
end
