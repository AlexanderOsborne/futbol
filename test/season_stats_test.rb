require_relative './test_helper'
require './lib/season_stats'
require './lib/game_team'

class SeasonStatsTest < Minitest::Test

  def setup
    @game_teams = CSV.foreach('./data/game_teams_dummy.csv', headers: true, header_converters: :symbol).map do |row|
      GameTeam.new(row)
    end

  end

  def test_most_tackles

    assert_equal "3", SeasonStats.most_tackles(@game_teams)
  end

  def test_fewest_tackles

    assert_equal "6", SeasonStats.fewest_tackles(@game_teams)
  end

  def test_teams_with_tackles
    expected = {"3"=>179, "6"=>174}

    assert_equal expected, SeasonStats.teams_with_tackles(@game_teams)
  end
end
