class GameTeam
  attr_reader :game_id, :team_id, :hoa, :result, :head_coach, :goals, :shots, :tackles, :parent

  def initialize(row, parent)
    @parent = parent
    @game_id = row[:game_id]
    @team_id = row[:team_id]
    @hoa = row[:hoa]
    @result = row[:result]
    @head_coach = row[:head_coach]
    @goals = row[:goals].to_i
    @shots = row[:shots].to_i
    @tackles = row[:tackles].to_i
    @team = team_name(row[:team_id])
  end

  def team_name(id)
    # require 'pry'; binding.pry
    @parent.find_team_name(id)
  end
end