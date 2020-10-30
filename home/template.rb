module Template

  def home_page_template
    %{
      <html lang="en-US">
        <head>
          <meta charset = "UTF-8">
          <title> Futbol Stats</title>
          <link rel="stylesheet" href="stylesheet.css" />
        </head>

        <body>
          <h1> Futbol Statistics</h1>
          <hr>

          <h2>Site Index</h2>
          <ul>
            <h3>Game Stats</h3>
            <h3>Team Stats</h3>
            <h3><Season Stats</h3>
          </ul>
        </body>
      </html>
    }
  end

end
