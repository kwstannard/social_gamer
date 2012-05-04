module Linker

  def links
    @links ||= Hash.new{|hash, key| hash[key] = []}
  end

  def create_link (instance_1, instance_2)
    links[instance_1] << instance_2
    links[instance_2] << instance_1
  end

  def delete_link(instance_1, instance_2)
    links[instance_1].delete(instance_2)
    links[instance_2].delete(instance_1)
  end

  def get_links(instance)
    @links[instance]
  end

end

class Application

  include Linker

  def people
    @people ||= []
  end

  def enroll_person(person)
    people << person
  end

  def unenroll_person(person)
    people.delete(person)
  end

#  def enter_a_game(person, game)
#    person.add_to_games(game)
#    game.add_to_players(person)
#  end
#
#  def leave_a_game(person, game)
#    person.remove_from_games(game)
#    game.remove_from_players(person)
#  end
end
