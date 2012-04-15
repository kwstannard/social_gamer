require_relative '../../spec_helper.rb'

describe Person do

  it_has_the_mtm_relations(:friends, :games, :events)
  it_has_the_attributes(:name_first, :name_last, :name_middle,
                        :location)

  it "can move to a new location" do
    location = double
    subject.move_to(location)
    subject.location.should == location
  end

end
