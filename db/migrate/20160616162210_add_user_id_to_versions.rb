class AddUserIdToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :user_id, :uuid
  end
end
