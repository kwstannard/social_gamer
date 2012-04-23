require 'spec_helper'
require 'application'
describe Application do

  describe '#make_friendship' do
    it 'adds two people to each-others friends lists' do
      person1, person2 = double, double
      person1.should_receive(:add_to_friends).with(person2)
      person2.should_receive(:add_to_friends).with(person1)
      subject.make_friendship(person1, person2)
    end
  end

  describe '#end_friendship' do
    it 'ends a friendship' do
      person1, person2 = double, double
      person1.should_receive(:remove_from_friends).with(person2)
      person2.should_receive(:remove_from_friends).with(person1)
      subject.end_friendship(person1, person2)
    end
  end

  describe '#enter_a_game' do
    it 'adds a player to a game and vice versa' do
      person, game = double, double
      person.should_receive(:add_to_games).with(game)
      game.should_receive(:add_to_players).with(person)
      subject.enter_a_game(person, game)
    end
  end

  describe '#leave_a_game' do
    it 'removes a player from a game and vice versa' do
      person, game = double, double
      person.should_receive(:remove_from_games).with(game)
      game.should_receive(:remove_from_players).with(person)
      subject.leave_a_game(person, game)
    end
  end
end
