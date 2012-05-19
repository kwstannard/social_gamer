load '~/social_gamer/spec_helper.rb'

describe Game, :type => :instance do
  it_has_the_attributes(:name, :alias,
                        :max_players, :min_players, :ideal_players)
end
