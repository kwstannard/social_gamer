load '~/social_gamer/spec_helper.rb'

describe Event do
  it_has_the_mtm_relations(:attendees, :games)
  it_has_the_attributes(:name, :location, :date_time)

  it "can move to a new location" do
    location = double
    subject.move_to(location)
    subject.location.should == location
  end

end
