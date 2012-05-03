test_object_file_path = nil
caller.each do |line|
  correct_line = line.scan(/^.*\/spec\/[^:]*/)
  if !correct_line.empty?
    test_object_file_path = correct_line.first.gsub("/spec/", "/app/").gsub("_spec", "")
    break
  end
end
require test_object_file_path

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
