require 'handlers/instance_handler'
require 'test_instances/user'
require 'test_instances/dog'

class Subj; include InstanceHandler; end

describe InstanceHandler do

  let(:subject) { Subj.new }

  let(:user) { User.new(email: double, password: double) }
  let(:user2) { User.new(email: double, password: double) }
  let(:dog) { Dog.new(name: double, dog_tag: double) }

  before(:each) do
    @dir = File.expand_path("../../../lib/test_instances", __FILE__)
    File.stub!(:expand_path) {@dir}
  end

  it "requires all files in the instance folder" do
    subject.stub!(:create_methods)
    subject.should_receive(:require).with(@dir + "/dog.rb")
    subject.should_receive(:require).with(@dir + "/user.rb")
    subject.load_instances
  end

  it "can retrieve an instance via one of its indexes" do
    subject.load_instances
    subject.absorb(user)
    subject.get_user_by_email(user.email).should == user
    subject.get_user_by_id(user.id).should == user
  end

  it "can return a list of instances of a given class" do
    subject.load_instances
    subject.absorb(user)
    subject.absorb(user2)
    subject.users.should == [user, user2]
  end

end
