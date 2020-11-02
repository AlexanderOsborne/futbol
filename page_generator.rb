require './lib/stat_tracker'
require './site/template'
require 'erb'

class PageGenerator
  include Template
  include ERB::Util

  def initialize(locations)
    @stat_tracker = StatTracker.from_csv(locations)
    @home_page_template = home_page_template
    @game_stats_template = game_stats_template
    @team_stats_template = team_stats_template
    @league_stats_template = league_stats_template
    @season_stats_template = season_stats_template
  end

  def render_home_page
    ERB.new(@home_page_template).result(binding)
  end

  def render_game_stats
    ERB.new(@game_stats_template).result(binding)
  end

  def render_team_stats
    ERB.new(@team_stats_template).result(binding)
  end

  def render_league_stats
    ERB.new(@league_stats_template).result(binding)
  end

  def render_season_stats
    ERB.new(@season_stats_template).result(binding)
  end
end

game_path = './data/games.csv'
team_path = './data/teams.csv'
game_teams_path = './data/game_teams.csv'

locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path
}

page_generator = PageGenerator.new(locations)

File.open('./site/stats.html', 'w') {|file| file.write(page_generator.render_home_page)}
File.open('./site/game_stats.html', 'w') {|file| file.write(page_generator.render_game_stats)}
File.open('./site/team_stats.html', 'w') {|file| file.write(page_generator.render_team_stats)}
File.open('./site/league_stats.html', 'w') {|file| file.write(page_generator.render_league_stats)}
File.open('./site/season_stats.html', 'w') {|file| file.write(page_generator.render_season_stats)}
