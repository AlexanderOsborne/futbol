require_relative './test_helper'
require './lib/teams_collection'


class TeamsCollectionTest < Minitest::Test

  def setup
    @parent = mock("Collection")
    @teamscollection = TeamsCollection.new('./data/teams.csv', @parent)
  end

  def test_it_exists

    assert_instance_of TeamsCollection, @teamscollection
  end

  def test_first_game

    assert_instance_of Team, @teamscollection.teams[0]
  end

  def test_all_games

    assert_equal 32, @teamscollection.teams.length
  end

  def test_count_of_teams

    assert_equal 32, @teamscollection.count_of_teams
  end

  def test_team_info

    expected = {
      "team_id" => "18",
      "franchise_id" => "34",
      "team_name" => "Minnesota United FC",
      "abbreviation" => "MIN",
      "link" => "/api/v1/teams/18"
    }
    assert_equal expected, @teamscollection.team_info("18")
  end
end
