class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books, id: :uuid do |t|
      t.string :title
      t.text :description
      t.datetime :deleted_at
    end
    add_index :books, :deleted_at
  end
end
