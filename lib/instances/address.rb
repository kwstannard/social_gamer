require_relative '../instance.rb'

class Address < Instance
  attr_reader :address_1, :address_2, :city, :state,
              :country, :latitude, :longitude
  set_mtm_relations :people, :locations
end
