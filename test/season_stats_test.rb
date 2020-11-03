require_relative './test_helper'
require './lib/season_stats'
require './lib/game_teams_collection'

class SeasonStatsTest < Minitest::Test

  def setup
    @season_stats = SeasonStats.new
    @game_teams_collection = GameTeamsCollection.new('./data/game_teams_dummy.csv', @parent)
  end

  def test_game_teams

    assert_equal [], @season_stats
  end
end
