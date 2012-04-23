def it_has_the_attributes(*args)
  args.each do |attr|
    it "has attribute #{attr}" do
      expect{ subject.send(attr) }.to_not raise_error(NoMethodError)
    end
  end
end

def it_has_the_mtm_relations(*args)
  describe "#mtm_relations" do
    it "returns #{args}" do
      subject.class.mtm_relations.should == args
    end
  end
end
