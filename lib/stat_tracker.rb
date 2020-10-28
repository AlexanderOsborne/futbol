# require_relative './games_collection'
# require_relative './teams_collection'
# require_relative './game_teams_collection'
require_relative './data_library'


class StatTracker < DataLibrary

  def initialize(locations)
    super
  end

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def highest_total_score #spec harness method
    highest = @games.max_by do |game|
      game[:total_score]
    end
    highest[:total_score]
  end

  def lowest_total_score
    lowest = @games.min_by do |game|
      game[:total_score]
    end
    lowest[:total_score]
  end

  def percentage_home_wins
    home_wins = @games.count do |game|
      game[:home_goals] > game[:away_goals]
    end
    (home_wins.to_f / @games.length).round(2)
  end

  def percentage_visitor_wins
    visitor_wins = @games.count do |game|
      game[:home_goals] < game[:away_goals]
    end
    (visitor_wins.to_f / @games.length).round(2)
  end

  def percentage_ties
    ties = @games.count do |game|
      game[:home_goals] == game[:away_goals]
    end
    (ties.to_f / @games.length).round(2)
  end

  def count_of_games_by_season
    seasons = Hash.new(0)
    @games.each do |game|
      seasons[game[:season]] += 1
    end
    seasons
  end

  def average_goals_per_game
    total_goals = @games.sum do |game|
      game[:total_score]
    end
    (total_goals.to_f / @games.count).round(2)
  end

  def average_goals_by_season
    seasons = Hash.new(0)
    @games.each do |game|
      seasons[game[:season]] += (game[:total_score])
    end
    count_of_games_by_season.merge(seasons) do |key, games_count, total_goals|
      (total_goals.to_f / games_count).round(2)
    end
  end

  def count_of_teams
    @teams.count
  end

  def total_goals
    total_goals = Hash.new {|h, k| h[k] = {home: 0, away: 0, total: 0, home_games: 0, away_games: 0, games_played: 0}}
    @game_teams.each do |game_team|
      if game_team[:hoa] == "home"
        total_goals[game_team[:team_id]][:home] += game_team[:goals].to_i
        total_goals[game_team[:team_id]][:home_games] += 1
      else
        total_goals[game_team[:team_id]][:away] += game_team[:goals].to_i
        total_goals[game_team[:team_id]][:away_games] += 1
      end
      total_goals[game_team[:team_id]][:total] += game_team[:goals].to_i
      total_goals[game_team[:team_id]][:games_played] += 1
    end
    total_goals
  end

  def best_offense
    best = total_goals.max_by do |key, value|
      value[:total].to_f / value[:games_played]
    end
    @teams.find do |team|
      if team[:team_id] == best[0]
        return team[:team_name]
      end
    end
  end

  def worst_offense
    worst = total_goals.min_by do |key, value|
      value[:total].to_f / value[:games_played]
    end
    @teams.find do |team|
      if team[:team_id] == worst[0]
        return team[:team_name]
      end
    end
  end

  def highest_scoring_visitor
    best = total_goals.max_by do |key, value|
      value[:away].to_f / value[:away_games]
    end
    @teams.find do |team|
      if team[:team_id] == best[0]
        return team[:team_name]
      end
    end
  end

  def highest_scoring_home_team
    best = total_goals.max_by do |key, value|
      value[:home].to_f / value[:home_games]
    end
    @teams.find do |team|
      if team[:team_id] == best[0]
        return team[:team_name]
      end
    end
  end

  def lowest_scoring_visitor
    worst = total_goals.min_by do |key, value|
      value[:away].to_f / value[:away_games]
    end
    @teams.find do |team|
      if team[:team_id] == worst[0]
        return team[:team_name]
      end
    end
  end

  def lowest_scoring_home_team
    worst = total_goals.min_by do |key, value|
      value[:home].to_f / value[:home_games]
    end
    @teams.find do |team|
      if team[:team_id] == worst[0]
        return team[:team_name]
      end
    end
  end

  def team_info(team_id)
    info = @teams.find do |team|
      team[:team_id] == team_id
    end
    info.delete(:stadium)
    info.transform_keys do |key|
      key.to_s
    end
  end

  def best_season
  end

  def worst_season
  end

  def average_win_percentage
  end

  def most_goals_scored
  end

  def fewest_goals_scored
  end

  def favorite_opponent
  end

  def rival
  end

  def winningest_coach
  end

  def worst_coach
  end

  def most_accurate_team
  end

  def least_accurate_team
  end

  def most_tackles
  end

  def fewest_tackles
  end

end
