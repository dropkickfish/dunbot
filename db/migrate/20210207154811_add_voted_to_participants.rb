class AddVotedToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :voted, :boolean
  end
end
