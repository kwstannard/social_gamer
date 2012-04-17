require_relative '../spec_helper.rb'

describe Instance do
  describe "#mtm_relations" do
    context "is passed :derp" do
      class Herp < Instance; set_mtm_relations :derp; end
      let(:obj) { double }
      let(:herp) { Herp.new }

      it "creates a getter method #derp" do
        herp.derp.should == []
      end

      it "creates #add_to_derp" do
        herp.add_to_derp(obj)
        herp.derp.should == [obj]
      end

      it "creates #remove_from_derp" do
        herp.add_to_derp(obj)
        herp.remove_from_derp(obj)
        herp.derp.should == []
      end
    end
  end
end
