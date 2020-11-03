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

  def test_most_accurate_team

    assert_equal "6", SeasonStats.most_accurate_team(@game_teams)
  end

  def test_least_accurate_team

    assert_equal "3", SeasonStats.least_accurate_team(@game_teams)
  end

  def test_shots_by_team_by_season
    expected = {"3"=>{:success=>38, :total=>8}, "6"=>{:success=>46, :total=>14}}

    assert_equal expected, SeasonStats.shots_by_team_by_season(@game_teams)
  end

  def test_wins_by_coach
    expected = {"John Tortorella"=>{:success=>0, :total=>5}, "Claude Julien"=>{:success=>5, :total=>5}}

    assert_equal expected, SeasonStats.wins_by_coach(@game_teams)
  end

  def test_winningest_coach

    assert_equal "Claude Julien", SeasonStats.winningest_coach(@game_teams)
  end

  def test_worst_coach

    assert_equal "John Tortorella", SeasonStats.worst_coach(@game_teams)
  end
end
