class Application
  def make_friendship(person1, person2)
    person1.add_to_friends(person2)
    person2.add_to_friends(person1)
  end

  def end_friendship(person1, person2)
    person1.remove_from_friends(person2)
    person2.remove_from_friends(person1)
  end

  def enter_a_game(person, game)
    person.add_to_games(game)
    game.add_to_players(person)
  end

  def leave_a_game(person, game)
    person.remove_from_games(game)
    game.remove_from_players(person)
  end
end
