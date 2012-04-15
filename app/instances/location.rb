require_relative '../instance.rb'

class Location < Instance
  attr_reader :name, :address_1, :address_2, :city, :state,
              :country, :latitude, :longitude
  set_mtm_relations :regulars, :events, :games
end
