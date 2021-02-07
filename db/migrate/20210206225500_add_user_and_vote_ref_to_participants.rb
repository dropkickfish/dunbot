class AddUserAndVoteRefToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_reference :participants, :user, null: false, foreign_key: true
    add_reference :participants, :vote, null: false, foreign_key: true
  end
end
