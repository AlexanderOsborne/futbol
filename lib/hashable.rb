require_relative './calculator'

module Hashable
  include Calculator

  def teams_with_tackles(season_id)
    game_teams_by_season(season_id).each_with_object(Hash.new(0)) do |game_team, teams|
        teams[game_team.team_id] += game_team.tackles
    end
  end

  def shots_by_team_by_season(season_id)
    game_teams_by_season(season_id).each_with_object(Hash.new {|h, k| h[k] = {success: 0, total: 0}}) do |game_team, stat|
        stat[game_team.team_id][:success] += game_team.shots
        stat[game_team.team_id][:total] += game_team.goals
    end
  end

  def wins_by_coach(season_id)
    game_teams_by_season(season_id).each_with_object(Hash.new {|h, k| h[k] = {success: 0, total: 0}}) do |game_team, wins|
        wins[game_team.head_coach][:total] += 1
        wins[game_team.head_coach][:success] += 1 if game_team.result == "WIN"
      end
  end

  def game_teams_by_season(season_id)
    @game_teams.select do |game_team|
      game_team.game_id[0..3] == season_id[0..3]
    end
  end

  def games_by_team
    games_by_hoa
  end

  def away_games_by_team
    games_by_hoa("away")
  end

  def home_games_by_team
    games_by_hoa("home")
  end

  def games_by_hoa(hoa = "all")
    @game_teams.each_with_object(Hash.new(0)) do |game_team, average|
      if game_team.hoa == hoa
        average[game_team.team_id] += 1
      elsif hoa == "all"
        average[game_team.team_id] += 1
      end
    end
  end

  def goal_total_by_hoa(hoa = "all")
    @game_teams.each_with_object(Hash.new(0)) do |game_team, average|
      if game_team.hoa == hoa
        average[game_team.team_id] += game_team.goals
      elsif hoa == "all"
        average[game_team.team_id] += game_team.goals
      end
    end
  end

  def average_goals_by_team
    combine(games_by_team, goal_total_by_hoa)
  end

  def average_away_goals_by_team
    combine(away_games_by_team, goal_total_by_hoa("away"))
  end

  def average_home_goals_by_team
    combine(home_games_by_team, goal_total_by_hoa("home"))
  end
end
