require 'spec_helper'
require 'application'
describe Application do

  let(:subject) { Application.new }
  let(:instances) { ["person.rb", "herp.rb"] }
  let(:person) { double("bob", :class => "Person", :id => "id1") }
  let(:person2) { double("jim", :class => "Person", :id => "id2") }
  let(:herp) { double("herp", :class => "Herp", :id => "id1") }
  let(:dir) { "/home/fake_path" }

  before(:each) do
    derp = File.expand_path("../../lib/application.rb", __FILE__)
    args = ["../../app/instances/", derp]
    File.stub!(:expand_path) {|a1, a2| dir if args == [a1,a2] }
    file_paths = instances.map{|i| "#{dir}/#{i}"}
    Dir.stub!(:[]) {|arg| file_paths if arg == "#{dir}/*" }

    subject.stub!(:require) do |arg|
      if arg == "#{dir}/#{instances.first}"
        class Person; end
      elsif arg == "#{dir}/#{instances.last}"
        class Herp;end
      end
    end
  end

  describe "InstanceHandler" do

    it "requires all files in the instance folder" do
      subject.stub!(:create_methods)
      subject.should_receive(:require).with("#{dir}/#{instances.first}")
      subject.should_receive(:require).with("#{dir}/#{instances.last}")
      subject.load_instances
    end

    it "can enter and retrieve an instance" do
      subject.load_instances
      subject.absorb(person)
      subject.get_person(person.id).should == person
    end

    it "can return a list of instances of a given class" do
      subject.load_instances
      subject.absorb(person)
      subject.absorb(person2)
      subject.persons == [person, person2]
    end
  end

  describe 'LinkHandler' do

    it "can return a list of linked instances of a given class" do
      subject.create_link(person, person2)
      subject.create_link(person, herp)
      subject.get_links(person, person2.class).should == [person2]
      subject.get_links(person, herp.class).should == [herp]
    end
  end

  #TODO move this instance specific stuff after gemifying application file
#  it "can add and remove a person from the list of people" do
#    subject.enroll_person(person)
#    subject.people.should == {person.id => person}
#    subject.unenroll_person(person)
#    subject.people.should == {}
#  end
#
#  it "can get a person from an id" do
#    subject.enroll_person(person)
#    subject.get_person(person.id).should == person
#  end
#

#  describe '#delete_link' do
#    it 'unlinks people' do
#      subject.create_link(person, person2)
#      subject.delete_link(person, person2)
#      subject.get_links(person).should == []
#      subject.get_links(person2).should == []
#    end
#  end
#
#  describe '#enter_a_game' do
#    it 'adds a player to a game and vice versa' do
#      game = double
#      person.should_receive(:add_to_games).with(game)
#      game.should_receive(:add_to_players).with(person)
#      subject.enter_a_game(person, game)
#    end
#  end
#
#  describe '#leave_a_game' do
#    it 'removes a player from a game and vice versa' do
#      game = double
#      person.should_receive(:remove_from_games).with(game)
#      game.should_receive(:remove_from_players).with(person)
#      subject.leave_a_game(person, game)
#    end
#  end
end
