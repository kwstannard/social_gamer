require 'spec_helper'
require 'application'
describe Application do

  it 'takes can give a name' do
    name = double
    subject = Application.new(name: name)
    subject.name.should be(name)
  end

end
