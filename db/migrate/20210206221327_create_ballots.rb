class CreateBallots < ActiveRecord::Migration[6.1]
  def change
    create_table :ballots do |t|
      t.integer :sequence
      t.timestamps
    end
  end
end
