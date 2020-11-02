module StatMethods
  def highest_total_score
    @games.highest_total_score
  end

  def lowest_total_score
    @games.lowest_total_score
  end

  def percentage_home_wins
    @games.percentage_home_wins
  end

  def percentage_visitor_wins
    @games.percentage_visitor_wins
  end

  def percentage_ties
    @games.percentage_ties
  end

  def count_of_games_by_season
    @games.count_of_games_by_season
  end

  def average_goals_per_game
    @games.average_goals_per_game
  end

  def average_goals_by_season
    @games.average_goals_by_season
  end

  def count_of_teams
    @teams.count_of_teams
  end

  def best_offense
    @game_teams.best_offense
  end

  def worst_offense
    @game_teams.worst_offense
  end

  def highest_scoring_visitor
    @game_teams.highest_scoring_visitor
  end

  def highest_scoring_home_team
    @game_teams.highest_scoring_hometeam
  end

  def lowest_scoring_visitor
    @game_teams.lowest_scoring_visitor
  end

  def lowest_scoring_home_team
    @game_teams.lowest_scoring_hometeam
  end

  def team_info(team_id)
    @teams.team_info(team_id)
  end

  def best_season(team_id)
    @games.best_season(team_id)
  end

  def worst_season(team_id)
    @games.worst_season(team_id)
  end

  def average_win_percentage(team_id)
    @games.average_win_percentage(team_id)
  end

  def most_goals_scored(team_id)
    @games.most_goals_scored(team_id)
  end

  def fewest_goals_scored(team_id)
    @games.fewest_goals_scored(team_id)
  end

  def favorite_opponent(team_id)
    @games.favorite_opponent(team_id)
  end

  def rival(team_id)
    @games.rival(team_id)
  end

  def winningest_coach(season_id)
    @game_teams.winningest_coach(season_id)
  end

  def worst_coach(season_id)
    @game_teams.worst_coach(season_id)
  end

  def most_accurate_team(season_id)
    @game_teams.most_accurate_team(season_id)
  end

  def least_accurate_team(season_id)
    @game_teams.least_accurate_team(season_id)
  end

  def most_tackles(season_id)
    @game_teams.most_tackles(season_id)
  end

  def fewest_tackles(season_id)
    @game_teams.fewest_tackles(season_id)
  end
end
