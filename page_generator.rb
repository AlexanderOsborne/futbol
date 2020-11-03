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

  def home_page
    File.open('./site/stats.html', 'w') {|page| page.write(ERB.new(@home_page_template).result(binding))}
  end

  def game_stats
    File.open('./site/game_stats.html', 'w') {|page| page.write(ERB.new(@game_stats_template).result(binding))}
  end

  def team_stats
    File.open('./site/team_stats.html', 'w') {|page| page.write(ERB.new(@team_stats_template).result(binding))}
  end

  def league_stats
    File.open('./site/league_stats.html', 'w') {|page| page.write(ERB.new(@league_stats_template).result(binding))}
  end

  def season_stats
    File.open('./site/season_stats.html', 'w') {|page| page.write(ERB.new(@season_stats_template).result(binding))}
  end

  def create_pages
    home_page
    game_stats
    team_stats
    league_stats
    season_stats
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
page_generator.create_pages
