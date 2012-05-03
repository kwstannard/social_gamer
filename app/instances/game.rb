require '~/social_gamer/lib/instance.rb'

class Game < Instance
  attr_reader :name, :alias, :max_players, :min_players, :ideal_players
  set_mtm_relations :players, :events
end
