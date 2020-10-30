require './lib/stat_tracker'
require './home/template'
require 'erb'

class PageGenerator
  include Template
  include ERB::Util

  def initialize(locations)
    @stat_tracker = StatTracker.from_csv(locations)
    @home_page_template = home_page_template
  end

  def render_home_page
    ERB.new(@home_page_template).result(binding)
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

File.open('./home/index.html', 'w') {|file| file.write(page_generator.render_home_page)}
