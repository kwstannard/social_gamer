require_relative '../../spec_helper.rb'

describe Address do
  it_has_the_mtm_relations(:people, :locations)
  it_has_the_attributes(:address_1, :address_2, :city, :state,
                        :country, :latitude, :longitude)
end
