load '~/social_gamer/spec_helper.rb'

describe Address, :type => :instance do

  it_has_the_mtm_relations(:people, :locations)
  it_has_the_attributes(:address_1, :address_2, :city, :state,
                        :country, :latitude, :longitude)
end
