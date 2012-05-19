load '~/social_gamer/spec_helper.rb'

describe Location, :type => :instance do
  it_has_the_attributes(:name, :address_id)
end
