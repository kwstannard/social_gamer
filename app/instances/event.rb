require_relative '../instance.rb'

class Event < Instance
  attr_reader :name, :location, :date_time
  set_mtm_relations :attendees, :games

  def move_to(new_place)
    @location = new_place
  end
end
