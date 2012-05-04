require 'spec_helper'
require 'application'
describe Application do

  let(:subject) { Application.new }
  let(:person) { double("bob") }
  let(:person2) { double("jim") }

  it "can add and remove a person from the list of people" do
    subject.enroll_person(person)
    subject.people.should eq [person]
    subject.unenroll_person(person)
    subject.people.should eq []
  end

  describe '#create_linke' do
    it 'can link two people together' do
      subject.create_link(person, person2)
      subject.get_links(person).should == [person2]
      subject.get_links(person2).should == [person]
    end
  end

  describe '#delete_link' do
    it 'unlinks people' do
      subject.create_link(person, person2)
      subject.delete_link(person, person2)
      subject.get_links(person).should == []
      subject.get_links(person2).should == []
    end
  end

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
