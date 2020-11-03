require_relative './game_team'
require_relative './calculator'
require_relative './hashable'

class GameTeamsCollection
  include Calculator
  include Hashable

  attr_reader :game_teams
  def initialize(game_teams_path)
    @game_teams = create_game_teams(game_teams_path)
  end

  def create_game_teams(game_teams_path)
    CSV.foreach(game_teams_path, headers: true, header_converters: :symbol).map do |row|
      GameTeam.new(row)
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
    game_teams.each_with_object(Hash.new(0)) do |game_team, average|
      if game_team.hoa == hoa
        average[game_team.team_id] += 1
      elsif hoa == "all"
        average[game_team.team_id] += 1
      end
    end
  end

  def goal_total_by_hoa(hoa = "all")
    game_teams.each_with_object(Hash.new(0)) do |game_team, average|
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

  def best_offense
    high(average_goals_by_team).first
  end

  def worst_offense
    low(average_goals_by_team).first
  end

  def highest_scoring_visitor
    high(average_away_goals_by_team).first
  end

  def highest_scoring_hometeam
    high(average_home_goals_by_team).first
  end

  def lowest_scoring_visitor
    low(average_away_goals_by_team).first
  end

  def lowest_scoring_hometeam
    low(average_home_goals_by_team).first
  end

  def winningest_coach(season_id)
    max_avg(wins_by_coach(season_id)).first
  end

  def worst_coach(season_id)
    min_avg(wins_by_coach(season_id)).first
  end

  def most_accurate_team(season_id)
    min_avg(shots_by_team_by_season(season_id)).first
  end

  def least_accurate_team(season_id)
    max_avg(shots_by_team_by_season(season_id)).first
  end

  def fewest_tackles(season_id)
    low(teams_with_tackles(season_id)).first
  end

  def most_tackles(season_id)
    high(teams_with_tackles(season_id)).first
  end
end
