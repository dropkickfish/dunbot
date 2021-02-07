class AddParticipantAndOptionRefToBallots < ActiveRecord::Migration[6.1]
  def change
    add_reference :ballots, :participant, null: false, foreign_key: true
    add_reference :ballots, :option, null: false, foreign_key: true
  end
end
