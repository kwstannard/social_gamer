require_relative '../../spec_helper.rb'

describe Game do
  it_has_the_mtm_relations(:players, :events)
  it_has_the_attributes(:name, :alias,
                        :max_players, :min_players, :ideal_players)
end
