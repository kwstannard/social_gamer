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


  describe '#make_friendship' do
    it 'adds two people to each-others friends lists' do
      person.should_receive(:add_to_friends).with(person2)
      person2.should_receive(:add_to_friends).with(person)
      subject.make_friendship(person, person2)
    end
  end

  describe '#end_friendship' do
    it 'ends a friendship' do
      person.should_receive(:remove_from_friends).with(person2)
      person2.should_receive(:remove_from_friends).with(person)
      subject.end_friendship(person, person2)
    end
  end

  describe '#enter_a_game' do
    it 'adds a player to a game and vice versa' do
      game = double
      person.should_receive(:add_to_games).with(game)
      game.should_receive(:add_to_players).with(person)
      subject.enter_a_game(person, game)
    end
  end

  describe '#leave_a_game' do
    it 'removes a player from a game and vice versa' do
      game = double
      person.should_receive(:remove_from_games).with(game)
      game.should_receive(:remove_from_players).with(person)
      subject.leave_a_game(person, game)
    end
  end
end
