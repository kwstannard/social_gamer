module InstanceSpecMethods
  def it_has_the_attributes(*args)
    args.each do |attr|
      it "has attribute #{attr}" do
        expect{ subject.send(attr) }.to_not raise_error(NoMethodError)
      end
    end
  end
end

RSpec.configure do |c|
  c.extend InstanceSpecMethods, :type => :instance
end
