module Template

  def home_page_template
    %{
      <html lang="en-US">
      <head>
          <meta charset = "UTF-8">
          <link rel="stylesheet" href="stylesheet.css" />
          <a href="./index.html" id="homePage"> Home Page</a>
          <br>
          <img src="./images/futbol_statistics.png" height="100" /img>
        </head>

        <body>
        <img src="./images/sensai_sal.png" height="100"/img>
          <table>
            <tr>
              <h2 colspan="2">Site Index</h2>
            </tr>
            <tr>
              <td><h3><a href="./game_stats.html" id="gameStats"> Game Stats </a></h3></td>
              <td> Game stats are across all teams, all seasons, all games. </td>
            </tr>
            <tr>
              <td><h3><a href="./team_stats.html"> Team Stats </a></h3></td>
              <td> Team Stats are team specific </td>
            </tr>
            <tr>
              <td><h3><a href="./league_stats.html">League Stats</a></h3></td>
              <td>League statistics are team specific across all seasons </td>
            </tr>
            <tr>
              <td><h3><a href="./season_stats.html">Season Stats</a></h3></td>
              <td> Seasons statistics are per team/coach with the best/worst ratios in a season</td>
            </tr>
          </table>
        </body>
      </html>
    }
  end

  def game_stats_template
    %{
      <html lang="en-US">
        <head>
        <a href="./index.html"> Home Page</a>
          <meta charset = "UTF-8">
          <title> Game Statistics </title>
          <link rel="stylesheet" href="stylesheet.css" />
        </head>

        <body>
          <h1> Game Statistics </h1>
          <table>
            <tr>
              <td> Highest Total Score </td>
              <td><%= @stat_tracker.highest_total_score %></td>
            </tr>
            <tr>
              <td> Lowest Total Score </td>
              <td><%= @stat_tracker.lowest_total_score %></td>
            </tr>
            <tr>
              <td> Percentage Home Wins </td>
              <td><%= @stat_tracker.percentage_home_wins %></td>
            </tr>
            <tr>
              <td> Percentage Visitor Wins </td>
              <td><%= @stat_tracker.percentage_visitor_wins %></td>
            </tr>
            <tr>
              <td> Percentage of Tied Games </td>
              <td><%= @stat_tracker.percentage_ties %></td>
            </tr>
            <tr>
              <td> Average number of Goals per Game </td>
              <td><%= @stat_tracker.average_goals_per_game %></td>
            </tr>
          </table>
          <table>
            <tr>
              <th colspan="2"><h2> Total number of games by Season </h2> </th>
            </tr>
            <tr>
              <th> Season </th>
              <th> Games </th>
            </tr>
            <tr>
            <% @stat_tracker.count_of_games_by_season.each do |season, games| %>
                <td><%= season %></td>
                <td><%= games %></td>
                </tr>
                <% end %>
          </table>
          <table>
          <tr>
            <th colspan="2"><h2> Average number of goals per game by Season </h2></th>
          </tr>
          <tr>
            <th> Season </th>
            <th> Goals </th>
          </tr>
          <tr>
          <% @stat_tracker.average_goals_by_season.each do |season, goals| %>
              <td><%= season %></td>
              <td><%= goals %></td>
            </tr>
            <% end %>
          </table>
        </body>
      </html>
    }
  end

  def team_stats_template
    %{
      <html lang="en-US">
        <head>
        <a href="./index.html"> Home Page</a>
          <meta charset = "UTF-8">
          <title> Team Statistics </title>
          <link rel="stylesheet" href="stylesheet.css" />
        </head>

        <body>
          <br>
          <br>
        <table>
          <tr>
            <th colspan="12"><h1> Team Statistics </h1></th>
          </tr>
            <tr>
            <% @stat_tracker.team_info("1").each do |key, value| %>
              <th><%= key %></th>
              <% end %>
              <th>Best Season</th>
              <th>Worst Season</th>
              <th>Average Wins</th>
              <th>Most Goals Scored</th>
              <th>Fewest Goals Scored</th>
              <th>FAVORITE OPPONENT</th>
              <th>Least Favorite RIVAL</th>
            <% @stat_tracker.teams.teams.each do |team| %>
            </tr>
            <tr>
            <% @stat_tracker.team_info(team.team_id).each do |key, value| %>
              <td><%= value %>
            <% end %>
            </td>
            <td><%= @stat_tracker.best_season(team.team_id) %></td>
            <td><%= @stat_tracker.worst_season(team.team_id) %></td>
            <td><%= @stat_tracker.average_win_percentage(team.team_id) %></td>
            <td><%= @stat_tracker.most_goals_scored(team.team_id) %></td>
            <td><%= @stat_tracker.fewest_goals_scored(team.team_id) %></td>
            <td><%= @stat_tracker.favorite_opponent(team.team_id) %></td>
            <td><%= @stat_tracker.rival(team.team_id) %></td>
            </tr>
            <% end %>
        </table>
        </body>
      </html>
    }
  end

  def league_stats_template
    %{
      <html lang="en-US">
        <head>
        <a href="./index.html"> Home Page</a>
          <meta charset = "UTF-8">
          <title> League Statistics </title>
          <link rel="stylesheet" href="stylesheet.css" />
        </head>

        <body>
          <table>
            <tr>
              <th colspan="7"><h1> League Statistics</h1></th>
            </tr>
            <tr>
              <th> Number of Teams </th>
              <th>Best Offense</th>
              <th>Worst Offense</th>
              <th>Highest Scoring Visitor</th>
              <th>Highest Scoring Home Team</th>
              <th>Lowest Scoring Visitor</th>
              <th>Lowest Scoring Home Team</th>
            </tr>
            <tr>
              <td><%= @stat_tracker.count_of_teams %></td>
              <td><%= @stat_tracker.best_offense %></td>
              <td><%= @stat_tracker.worst_offense %></td>
              <td><%= @stat_tracker.highest_scoring_visitor %></td>
              <td><%= @stat_tracker.highest_scoring_home_team %></td>
              <td><%= @stat_tracker.lowest_scoring_visitor %></td>
              <td><%= @stat_tracker.lowest_scoring_home_team %></td>
            </tr>
          </table>
        </body>
      </html>
    }
  end

  def season_stats_template
    %{
      <html lang="en-US">
        <head>
        <a href="./index.html"> Home Page</a>
          <meta charset = "UTF-8">
          <title> Season Statistics </title>
          <link rel="stylesheet" href="stylesheet.css" />
        </head>

        <body>
          <table
            <tr>
              <th colspan="7"><h1> Season Statistics</h1></th>
            </tr>
            <tr>
              <th> Season </th>
              <th> Winningest Coach </th>
              <th> Worst Coach </th>
              <th> Most Accurate Team</th>
              <th>Least Accurate Team</th>
              <th>Most Tackles </th>
              <th>Fewest Tackles </th>
            </tr>
            <% seasons = [] %>
            <% @stat_tracker.games.games.each do |game| %>
              <% seasons << game.season unless seasons.include?(game.season) %>
            <% end %>
            <tr>
            <% seasons.each do |season| %>
              <td><%= season %></td>
              <td><%= @stat_tracker.winningest_coach(season) %></td>
              <td><%= @stat_tracker.worst_coach(season) %></td>
              <td><%= @stat_tracker.most_accurate_team(season) %></td>
              <td><%= @stat_tracker.least_accurate_team(season) %></td>
              <td><%= @stat_tracker.most_tackles(season) %></td>
              <td><%= @stat_tracker.fewest_tackles(season) %></td>
            </tr>
            <% end %>
          </table>
        </body>
      </html>
    }
  end

end
