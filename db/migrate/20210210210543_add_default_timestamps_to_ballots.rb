class AddDefaultTimestampsToBallots < ActiveRecord::Migration[6.1]
  def change
    change_column_default :ballots, :created_at, -> { 'CURRENT_TIMESTAMP' }
    change_column_default :ballots, :updated_at, -> { 'CURRENT_TIMESTAMP' }
  end
end
