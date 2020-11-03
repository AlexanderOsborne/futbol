require_relative './game_teams_collection.rb'
require_relative './calculator.rb'

class SeasonStats < GameTeamsCollection
include Calculator

  def initialize
    @game_teams = game_teams
    super
  end

  def game_teams
    game_teams_by_season
  end

  def wins_by_coach(season_id)
    game_teams.game_teams.each_with_object(Hash.new {|h, k| h[k] = {success: 0, total: 0}}) do |game_team, wins|
      next unless game_team.game_id[0..3] == season_id[0..3]
      wins[game_team.head_coach][:total] += 1
      wins[game_team.head_coach][:success] += 1 if game_team.result == "WIN"
    end
  end

  def winningest_coach(season_id)
    max_avg(wins_by_coach(season_id)).first
  end

  def worst_coach(season_id)
    min_avg(wins_by_coach(season_id)).first
  end

  def shots_by_team_by_season(season_id)
    game_teams.game_teams.each_with_object(Hash.new {|h, k| h[k] = {success: 0, total: 0}}) do |game_team, stat|
      next unless game_team.game_id[0..3] == season_id[0..3]
      stat[game_team.team_id][:success] += game_team.shots
      stat[game_team.team_id][:total] += game_team.goals
    end
  end

  def most_accurate_team(season_id)
    min_avg(shots_by_team_by_season(season_id)).first
  end

  def least_accurate_team(season_id)
    max_avg(shots_by_team_by_season(season_id)).first
  end

  def teams_with_tackles(season_id)
    game_teams.game_teams.each_with_object(Hash.new(0)) do |game_team, teams|
      next unless game_team.game_id[0..3] == season_id[0..3]
      teams[game_team.team_id] += game_team.tackles
    end
  end

  def most_tackles(season_id)
    high(teams_with_tackles(season_id)).first
  end

  def fewest_tackles(season_id)
    low(teams_with_tackles(season_id)).first
  end

end
