class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :participants
      t.references :options, null: false, foreign_key: true
      t.timestamps
    end
  end
end
