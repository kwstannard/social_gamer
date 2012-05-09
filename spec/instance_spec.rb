require File.expand_path("../../lib/instance.rb", __FILE__)

describe Instance do
  class Herp < Instance; end

  it "always has an id field" do
    h = Herp.new("derp")
    h.id.should == "derp"
  end

end
