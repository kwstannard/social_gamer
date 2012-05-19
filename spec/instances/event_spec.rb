load '~/social_gamer/spec_helper.rb'

describe Event, :type => :instance do
  it_has_the_attributes(:name, :location, :date_time)

  let(:subject) { Event.new(1) }
  it "can move to a new location" do
    location = double
    subject.move_to(location)
    subject.location.should == location
  end

end
