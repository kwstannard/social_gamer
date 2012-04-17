require_relative '../instance.rb'

class Location < Instance
  attr_reader :name, :address_id
  set_mtm_relations :regulars, :events, :games
end
