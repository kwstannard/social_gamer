require_relative '../../spec_helper.rb'

describe Location do
  it_has_the_mtm_relations(:regulars, :events, :games)
  it_has_the_attributes(:name, :address_1, :address_2, :city, :state,
                        :country, :latitude, :longitude)
end
