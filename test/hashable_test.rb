require_relative './test_helper'
require './lib/hashable'
require './lib/game_team'
require './lib/calculator'

class HashableTest < Minitest::Test
  include Hashable
  include Calculator

  def setup
    @game_teams = CSV.foreach('./data/game_teams_dummy.csv', headers: true, header_converters: :symbol).map do |row|
      GameTeam.new(row)
    end
  end

  def test_teams_with_tackles
    stubs(:game_teams_by_season).returns(@game_teams)
    expected = {"3"=>179, "6"=>174}

    assert_equal expected, teams_with_tackles("20122013")
  end

  def test_shots_by_team_by_season
    stubs(:game_teams_by_season).returns(@game_teams)
    expected = {"3"=>{:success=>38, :total=>8}, "6"=>{:success=>46, :total=>14}}

    assert_equal expected, shots_by_team_by_season("20122013")
  end

  def test_wins_by_coach
    stubs(:game_teams_by_season).returns(@game_teams)
    expected = {"John Tortorella"=>{:success=>0, :total=>5}, "Claude Julien"=>{:success=>5, :total=>5}}

    assert_equal expected, wins_by_coach("20122013")
  end

  def test_game_teams_by_season
    actual = game_teams_by_season("20122013").all? do |game_team|
      game_team.class == GameTeam
    end

    assert_equal true, actual
  end

  def test_games_by_team

    expected = {"3"=>5, "6"=>5}
    assert_equal expected, games_by_team
  end

  def test_away_games_by_team

    expected = {"3"=>3, "6"=>2}
    assert_equal expected, away_games_by_team
  end

  def test_goal_total_by_hoa
    assert_equal ({"6"=>9, "3"=>3}), goal_total_by_hoa("home")
    assert_equal ({"3"=>5, "6"=>5}), goal_total_by_hoa("away")
    assert_equal ({"3"=>8, "6"=>14}), goal_total_by_hoa
  end

  def test_games_by_hoa
    assert_equal ({"6"=>3, "3"=>2}), games_by_hoa("home")
    assert_equal ({"3"=>3, "6"=>2}), games_by_hoa("away")
    assert_equal ({"3"=>5, "6"=>5}), games_by_hoa
  end

  def test_home_games_by_team

    expected = {"6"=>3, "3"=>2}
    assert_equal expected, home_games_by_team
  end

  def test_average_goals_by_team

    expected = {"3"=>1.6, "6"=>2.8}
    assert_equal expected, average_goals_by_team
  end

  def test_average_away_goals_by_team

    expected = {"3"=>1.67, "6"=>2.5}
    assert_equal expected, average_away_goals_by_team
  end

  def test_average_home_goals_by_team

    expected ={"6"=>3.0, "3"=>1.5}
    assert_equal expected, average_home_goals_by_team
  end
end
