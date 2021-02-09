class UpdateNameInParticipants < ActiveRecord::Migration[6.1]
  def change
    rename_column :participants, :name, :username
  end
end
