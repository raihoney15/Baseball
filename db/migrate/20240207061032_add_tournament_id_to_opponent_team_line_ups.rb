class AddTournamentIdToOpponentTeamLineUps < ActiveRecord::Migration[7.1]
  def change
    add_reference :opponent_team_line_ups, :tournament, null: false, foreign_key: true
  end
end
