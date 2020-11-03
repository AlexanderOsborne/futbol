require_relative './test_helper'
require './lib/league_stats'
require './lib/game_team'

class LeagueStatsTest < Minitest::Test

  def setup
    @game_teams = CSV.foreach('./data/game_teams_dummy.csv', headers: true, header_converters: :symbol).map do |row|
      GameTeam.new(row)
    end
  end
end
