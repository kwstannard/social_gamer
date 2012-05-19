require '~/social_gamer/lib/instance.rb'

class Game < Instance
  attr_reader :name, :alias, :max_players, :min_players, :ideal_players
end
