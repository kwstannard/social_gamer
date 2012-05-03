require '~/social_gamer/lib/instance.rb'

class Location < Instance
  attr_reader :name, :address_id
  set_mtm_relations :regulars, :events, :games
end
