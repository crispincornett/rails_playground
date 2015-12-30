class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients, id: :uuid do |t|
      t.string :short_name, null: false, limit: 25
      t.string :full_name
      t.integer :users_count, null: false, default: 0

      t.timestamps null: false
    end
  end
end
