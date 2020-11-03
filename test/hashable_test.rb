require_relative './test_helper'
require './lib/hashable'
require './lib/game_team'

class HashableTest < Minitest::Test
  include Hashable

  def setup
    @game_teams = CSV.foreach('./data/game_teams_dummy.csv', headers: true, header_converters: :symbol).map do |row|
      GameTeam.new(row)
    end
    stubs(:game_teams_by_season).returns(@game_teams)
  end

  def test_teams_with_tackles
    expected = {"3"=>179, "6"=>174}

    assert_equal expected, teams_with_tackles("20122013")
  end

  def test_shots_by_team_by_season
    expected = {"3"=>{:success=>38, :total=>8}, "6"=>{:success=>46, :total=>14}}

    assert_equal expected, shots_by_team_by_season("20122013")
  end

  def test_wins_by_coach
    expected = {"John Tortorella"=>{:success=>0, :total=>5}, "Claude Julien"=>{:success=>5, :total=>5}}

    assert_equal expected, wins_by_coach("20122013")
  end
end
