load '~/social_gamer/spec_helper.rb'

describe Location do
  it_has_the_mtm_relations(:regulars, :events, :games)
  it_has_the_attributes(:name, :address_id)
end
