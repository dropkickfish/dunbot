class AddVoteToOptions < ActiveRecord::Migration[6.1]
  def change
    add_reference :options, :vote, null: false, foreign_key: true
  end
end
