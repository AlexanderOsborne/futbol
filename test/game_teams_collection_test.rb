require_relative './test_helper'
require './lib/game_teams_collection'

class GameTeamsCollectionTest < Minitest::Test

  def setup
    @gameteamcollection = GameTeamsCollection.new('./data/game_teams_dummy.csv')
  end

  def test_it_exists

    assert_instance_of GameTeamsCollection, @gameteamcollection
  end

  def test_first_game
    assert_instance_of GameTeam, @gameteamcollection.game_teams[0]
  end

  def test_all_games

    assert_equal 10, @gameteamcollection.game_teams.length
  end

  def test_games_by_team

    expected = {"3"=>5, "6"=>5}

    assert_equal expected, @gameteamcollection.games_by_team
  end

  def test_away_games_by_team

    expected = {"3"=>3, "6"=>2}

    assert_equal expected, @gameteamcollection.away_games_by_team
  end

  def test_goal_total_by_hoa

    assert_equal ({"6"=>9, "3"=>3}), @gameteamcollection.goal_total_by_hoa("home")
    assert_equal ({"3"=>5, "6"=>5}), @gameteamcollection.goal_total_by_hoa("away")
    assert_equal ({"3"=>8, "6"=>14}), @gameteamcollection.goal_total_by_hoa
  end

  def test_games_by_hoa

    assert_equal ({"6"=>3, "3"=>2}), @gameteamcollection.games_by_hoa("home")
    assert_equal ({"3"=>3, "6"=>2}), @gameteamcollection.games_by_hoa("away")
    assert_equal ({"3"=>5, "6"=>5}), @gameteamcollection.games_by_hoa
  end

  def test_home_games_by_team

    expected = {"6"=>3, "3"=>2}

    assert_equal expected, @gameteamcollection.home_games_by_team
  end

  def test_average_goals_by_team

    expected = {"3"=>1.6, "6"=>2.8}

    assert_equal expected, @gameteamcollection.average_goals_by_team
  end

  def test_average_away_goals_by_team

    expected = {"3"=>1.67, "6"=>2.5}

    assert_equal expected, @gameteamcollection.average_away_goals_by_team
  end

  def test_average_home_goals_by_team

    expected ={"6"=>3.0, "3"=>1.5}
    
    assert_equal expected, @gameteamcollection.average_home_goals_by_team
  end

  def test_best_offense

    assert_equal "6", @gameteamcollection.best_offense
  end

  def test_worst_offense

    assert_equal "3", @gameteamcollection.worst_offense
  end

  def test_highest_scoring_visitor

    assert_equal "6", @gameteamcollection.highest_scoring_visitor
  end

  def test_highest_scoring_hometeam

    assert_equal "6", @gameteamcollection.highest_scoring_hometeam
  end

  def test_lowest_scoring_visitor

    assert_equal "3", @gameteamcollection.lowest_scoring_visitor
  end

  def test_lowest_scoring_home_team

    assert_equal "3", @gameteamcollection.lowest_scoring_hometeam
  end

  def test_wins_by_coach

    expected = {"John Tortorella"=>{:success=>0, :total=>5}, "Claude Julien"=>{:success=>5, :total=>5}}

    assert_equal expected, @gameteamcollection.wins_by_coach("20122013")
  end

  def test_winningest_coach

    assert_equal "Claude Julien", @gameteamcollection.winningest_coach("20122013")
  end

  def test_worst_coach

    assert_equal "John Tortorella", @gameteamcollection.worst_coach("20122013")
  end

  def test_most_accurate_team

    expected = {"3"=>{:success=>38, :total=>8}, "6"=>{:success=>46, :total=>14}}

    assert_equal expected, @gameteamcollection.shots_by_team_by_season("20122013")
    assert_equal "6", @gameteamcollection.most_accurate_team("20122013")
  end

  def test_least_accurate_team

    assert_equal "3", @gameteamcollection.least_accurate_team("20122013")
  end

  def test_teams_with_tackles

    expected = {"3"=>179, "6"=>174}

    assert_equal expected, @gameteamcollection.teams_with_tackles("20122013")
  end

  def test_most_tackles

    assert_equal "3", @gameteamcollection.most_tackles("20122013")
  end

  def test_fewest_tackles

    assert_equal "6", @gameteamcollection.fewest_tackles("20122013")
  end
end
