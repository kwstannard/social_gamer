load '~/social_gamer/spec_helper.rb'

describe Person, :type => :instance do

  it_has_the_attributes(:name_first, :name_last, :name_middle,
                        :location)

  let(:subject) { Person.new(1) }
  it "can move to a new location" do
    location = double
    subject.move_to(location)
    subject.location.should == location
  end

end
