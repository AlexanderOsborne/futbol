require_relative './game'
require_relative './game_teams_collection'

class GamesCollection
  attr_reader :games

  def initialize(file_path, parent)
    @parent = parent
    @games = []
    create_games(file_path)
  end

  def create_games(file_path)
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      @games << Game.new(row, self)
    end
  end

  def highest_total_score
    highest = @games.max_by do |game|
      game.total_score
    end
    highest.total_score
  end

  def lowest_total_score
    lowest = @games.min_by do |game|
      game.total_score
    end
    lowest.total_score
  end

  def percentage_home_wins
    (home_wins.to_f / @games.length).round(2)
  end

  def percentage_visitor_wins
    (visitor_wins.to_f / @games.length).round(2)
  end

  def percentage_ties
    (ties.to_f / @games.length).round(2)
  end

  def home_wins
    games.count do |game|
      game.home_goals > game.away_goals
    end
  end

  def visitor_wins
    games.count do |game|
      game.home_goals < game.away_goals
    end
  end

  def ties
    games.count do |game|
      game.home_goals == game.away_goals
    end
  end

  def count_of_games_by_season
    seasons = Hash.new(0)
    games.each do |game|
      seasons[game.season] += 1
    end
    seasons
  end

  def average_goals_per_game
    total_goals = games.sum do |game|
      game.total_score
    end
    (total_goals.to_f / games.count).round(2)
  end

  def average_goals_by_season
    seasons = Hash.new(0)
    games.each do |game|
      seasons[game.season] += game.total_score
    end
    count_of_games_by_season.merge(seasons) do |key, games_count, total_goals|
      (total_goals.to_f / games_count).round(2)
    end
  end
end