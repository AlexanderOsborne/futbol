module Template

  def home_page_template
    %{
      <html lang="en-US">
        <head>
          <meta charset = "UTF-8">
          <title> Futbol Stats</title> <a href="./index.html"> Home Page</a>
          <link rel="stylesheet" href="stylesheet.css" />
        </head>

        <body>
          <h1> Futbol Statistics</h1>
          <hr>

          <h2>Site Index</h2>
          <ol>
            <h3><a href="./game_stats.html"> Game Stats </a></h3>
            <h3><a href="./team_stats.html"> Team Stats </a></h3>
            <h3><a href="./league_stats.html">League Stats</a></h3>
            <h3><a href="./season_stats.html">Season Stats</a></h3>
          </ol>
        </body>
      </html>
    }
  end

  def game_stats_template
    %{
      <html lang="en-US">
        <head>
          <meta charset = "UTF-8">
          <title> Team Statistics </title>
          <link rel="stylesheet" href="stylesheet.css" />
        </head>

        <body>
          <h1> Team Stats </h1>
          <td> Highest Total Score </td>
          <td><%= @stat_tracker.highest_total_score %><td>
        </body>
      </html>
    }
  end

  def team_stats_template
    %{
      <html lang="en-US">
        <head>
          <meta charset = "UTF-8">
          <title> Team Statistics </title>
          <link rel="stylesheet" href="stylesheet.css" />
        </head>

        <body>
          <h1> Team Stats </h1>
        </body>
      </html>
    }
  end

  def league_stats_template
    %{
      <html lang="en-US">
        <head>
          <meta charset = "UTF-8">
          <title> Team Statistics </title>
          <link rel="stylesheet" href="stylesheet.css" />
        </head>

        <body>
          <h1> Team Stats </h1>
        </body>
      </html>
    }
  end

  def season_stats_template
    %{
      <html lang="en-US">
        <head>
          <meta charset = "UTF-8">
          <title> Team Statistics </title>
          <link rel="stylesheet" href="stylesheet.css" />
        </head>

        <body>
          <h1> Team Stats </h1>
        </body>
      </html>
    }
  end

end
