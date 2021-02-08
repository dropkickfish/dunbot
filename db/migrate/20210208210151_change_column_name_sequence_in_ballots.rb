class ChangeColumnNameSequenceInBallots < ActiveRecord::Migration[6.1]
  def change
    rename_column :ballots, :sequence, :position
  end
end
