class Team
  attr_reader :team_id, :franchiseid, :teamname, :abbreviation, :link

  def initialize(row)
    @team_id = row[:team_id]
    @franchiseid = row[:franchiseid]
    @teamname = row[:teamname]
    @abbreviation = row[:abbreviation]
    @link = row[:link]
  end

  def team_info
<<<<<<< HEAD
    new_team_info = {}
    new_team_info["team_name"] = @teamname
    new_team_info["team_id"] = @team_id
    new_team_info["franchise_id"] = @franchiseid
    new_team_info["abbreviation"] = @abbreviation
    new_team_info["link"] = @link
    new_team_info
=======
    {
    "team_id" => @team_id,
    "franchise_id"=> @franchiseid,
    "team_name"=> @teamname,
    "abbreviation"=> @abbreviation,
    "link"=> @link
    }
>>>>>>> 91956d517903ac19c73d1c2d4dd49bfdef9c4566
  end
end
